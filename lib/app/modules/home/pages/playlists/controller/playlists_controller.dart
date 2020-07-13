import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/dialog_widget/dialog_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'playlists_controller.g.dart';

class PlaylistsController = _PlaylistsControllerBase with _$PlaylistsController;

abstract class _PlaylistsControllerBase with Store {
  @observable
  bool isFocus = false;

  List<String> playlists = [];

  final focusNode = FocusNode();
  final textEditingController = TextEditingController();
  final playlistKey = GlobalKey<AnimatedListState>();

  _PlaylistsControllerBase() {
    getPlaylistKeys();
    focusNode.addListener(focusChanged);
  }

  Future<void> getPlaylistKeys() async {
    List<String> playlistNames =
        await Modular.get<HomeStore>().getDataOnDisk(Constants.PLAYLIST_KEY);

    playlistNames.forEach((playlistName) {
      playlists.add(playlistName);

      if (playlistKey.currentState != null)
        playlistKey.currentState.insertItem(playlists.length - 1);
    });
  }

  @action
  void focusChanged() {
    isFocus = focusNode.hasFocus;
  }

  Future<void> removePlaylist(BuildContext context, String playlist) async {
    bool decision = await dialogWidget(
        context: context,
        title: 'You will remove the $playlist playlist.',
        content: 'Are you sure?',
        firstOption: FlatButton(
            onPressed: () => Navigator.pop(context, false), child: Text('No')),
        secondOption: FlatButton(
            onPressed: () => Navigator.pop(context, true), child: Text('Yes')));

    if (!decision) return;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await Modular.get<HomeStore>()
        .removeDataOnDisk(Constants.PLAYLIST_KEY, playlist);

    sharedPreferences.remove(playlist);

    int index = playlists.indexOf(playlist);
    playlists.removeAt(index);
    playlistKey.currentState.removeItem(index,
        (context, animation) => Center(child: CircularProgressIndicator()));
  }
}
