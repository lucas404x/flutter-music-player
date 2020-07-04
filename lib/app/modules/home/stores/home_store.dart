import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';
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

  Future<List<String>> getFavoriteSongs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (!sharedPreferences.containsKey(Constants.FAVORITE_KEY)) {
      await sharedPreferences.setStringList(Constants.FAVORITE_KEY, []);
    }

    return sharedPreferences.getStringList(Constants.FAVORITE_KEY);
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
