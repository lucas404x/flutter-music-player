import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'playlist_controller.g.dart';

class PlayListController = _PlayListControllerBase with _$PlayListController;

abstract class _PlayListControllerBase with Store {
  List<String> playlists = [];

  @observable
  double heightScreen;

  FocusNode focusNode;

  _PlayListControllerBase(double heightScreen, FocusNode focusNode) {
    this.heightScreen = heightScreen;
    this.focusNode = focusNode;
    getPlaylists();

    this.focusNode.addListener(focusChanged);
  }

  Future<void> getPlaylists() async {
    playlists =
        await Modular.get<HomeStore>().getSongsOnDisk(Constants.PLAYLIST_KEY);
  }

  @action
  void focusChanged() {
    if (!focusNode.hasFocus)
      heightScreen = heightScreen - heightScreen * 0.26;
    else
      heightScreen = heightScreen + heightScreen * 0.35;
    print(heightScreen);
  }
}
