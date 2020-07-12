import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mobx/mobx.dart';
part 'select_songs_controller.g.dart';

class SelectSongsController = _SelectSongsControllerBase
    with _$SelectSongsController;

abstract class _SelectSongsControllerBase with Store {
  List<Song> songs = [];

  final animatedListKey = GlobalKey<AnimatedListState>();

  @observable
  ObservableList<int> selectedSongsIndex = ObservableList<int>();

  final _flutterSoundHelper = FlutterSoundHelper();

  _SelectSongsControllerBase() {
    getSongs();
  }

  @action
  getSongs() {
    Map data = {};

    Modular.get<HomeStore>().directory.listSync().forEach((song) {
      _flutterSoundHelper.FFmpegGetMediaInformation(song.absolute.path)
          .then((value) {
        data.addAll(value['metadata']);
        data['path'] = song.absolute.path;
        songs.add(Song.fromJson(data));
        data.clear();

        if (animatedListKey.currentState != null)
          animatedListKey.currentState.insertItem(songs.length - 1);
      });
    });
  }

  @action
  changeState(bool state, int index) {
    print(selectedSongsIndex.contains(index));
    if (selectedSongsIndex.contains(index))
      selectedSongsIndex.remove(index);
    else
      selectedSongsIndex.add(index);
  }

  finish() => Modular.to
      .pop(selectedSongsIndex.map((index) => songs[index].path).toList());
}
