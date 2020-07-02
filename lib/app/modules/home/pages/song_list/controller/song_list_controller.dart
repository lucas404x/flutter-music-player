import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mobx/mobx.dart';

part 'song_list_controller.g.dart';

class SongListController = _SongListControllerBase with _$SongListController;

abstract class _SongListControllerBase with Store {
  final _flutterSoundHelper = FlutterSoundHelper();

  final _songListKey = GlobalKey<AnimatedListState>();
  GlobalKey<AnimatedListState> get songListKey => _songListKey;

  final _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  @observable
  bool _showButton = true;
  @computed
  bool get showButton => _showButton;

  @computed
  double get shuffleButtonOrNot => _showButton ? 1.0 : 0.0;

  List<String> _favorites;

  _SongListControllerBase() {
    getAllSongs();

    _scrollController.addListener(_scrollControllerListener);
  }

  List<Song> songs = [];

  void getAllSongs() {
    Map data = {};
    Directory directory = Modular.get<HomeStore>().directory;

    directory.listSync(recursive: true).forEach((systemFile) {
      _flutterSoundHelper.FFmpegGetMediaInformation(systemFile.absolute.path)
          .then((Map value) async {
        data.addAll(value['metadata']);
        data['duration'] = value['duration'];
        data['path'] = systemFile.absolute.path;

        if (_favorites == null)
          _favorites = await Modular.get<HomeStore>().getFavoriteSongs();

        if (_favorites.contains(data['path'])) {
          data['isFavorite'] = true;
        } else {
          data['isFavorite'] = false;
        }

        songs.add(Song.fromJson(data));

        if (_songListKey.currentState != null)
          _songListKey.currentState.insertItem(songs.length - 1);

        data.clear();
      });
    });
  }

  void _scrollControllerListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 10) {
      _changeShowButtonState(false);
    } else {
      _changeShowButtonState(true);
    }
  }

  @action
  void _changeShowButtonState(bool newState) {
    _showButton = newState;
  }

  void dispose() {
    _scrollController.dispose();
  }
}