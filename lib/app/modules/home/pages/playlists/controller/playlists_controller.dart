import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';
import 'package:mobx/mobx.dart';
part 'playlists_controller.g.dart';

class PlaylistsController = _PlaylistsControllerBase with _$PlaylistsController;

abstract class _PlaylistsControllerBase with Store {
  @observable
  bool isFocus = false;

  @observable
  List<String> playlists;

  final focusNode = FocusNode();
  final textEditingController = TextEditingController();

  _PlaylistsControllerBase() {
    getPlaylistKeys();
    focusNode.addListener(focusChanged);
  }

  @action
  Future<void> getPlaylistKeys() async {
    playlists =
        await Modular.get<HomeStore>().getSongsOnDisk(Constants.PLAYLIST_KEY);
  }

  @action
  void focusChanged() {
    isFocus = focusNode.hasFocus;
  }
}
