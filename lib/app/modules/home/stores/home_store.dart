import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  AudioPlayer audioPlayer = AudioPlayer();

  Directory directory;

  Song song;

  List<Song> songsMode;

  _HomeStoreBase(Directory directory) {
    this.directory = directory;
  }

  @action
  void changeFavoriteState(Song _song) {
    if (song != null && song.path == _song.path) {
      song.isFavorite = _song.isFavorite;
    }
  }

  Future<List<String>> getSongsOnDisk(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (!sharedPreferences.containsKey(key)) {
      await sharedPreferences.setStringList(key, []);
    }

    return sharedPreferences.getStringList(key);
  }

  Future<bool> saveDataOnDisk(String key, {String value}) async {
    /*
    if value is equal to null, 
    it will understand that you want to create a new key.
    */

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value == null) return sharedPreferences.setStringList(key, []);

    List<String> data = await getSongsOnDisk(key);

    if (!data.contains(value)) data.add(value);
    return sharedPreferences.setStringList(key, data);
  }

  Future<void> removeSong(String key, String path) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> value = await getSongsOnDisk(key);
    value.remove(path);
    await sharedPreferences.setStringList(key, value);
  }

  void getRandomSong() {
    if (songsMode.length == 0) return;
    if (songsMode.length == 1) {
      song = songsMode[0];
      return;
    }

    int seed = DateTime.now().millisecondsSinceEpoch;
    songsMode.shuffle(Random(seed));

    print(songsMode);

    song = songsMode[0] == song ? songsMode[1] : songsMode[0];
  }

  String limitText(String text, int limit) {
    if (text.length <= limit) return text;

    return text.substring(0, limit - 3) + '...';
  }

  Future<void> dispose() async {
    audioPlayer.stop();
  }
}
