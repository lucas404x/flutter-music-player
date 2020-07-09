import 'package:flutter/cupertino.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/dialog_widget/dialog_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'create_playlist_controller.g.dart';

class CreatePlaylistController = _CreatePlaylistControllerBase
    with _$CreatePlaylistController;

abstract class _CreatePlaylistControllerBase with Store {
  bool _isFocus;

  double _heightScreenWithFocusOn;
  double _heightScreenWithFocusOff;

  set heightScreen(double heightScreen) {
    _heightScreenWithFocusOn = heightScreen;
    _heightScreenWithFocusOff = heightScreen * 0.26;
  }

  double get heightScreen =>
      _isFocus ? _heightScreenWithFocusOn : _heightScreenWithFocusOff;

  final textEditingController = TextEditingController();

  _CreatePlaylistControllerBase(bool isFocus) {
    _isFocus = isFocus;
  }

  Future<void> createPlaylist(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String playlistName = textEditingController.text;

    if (playlistName == '') return;

    if (!sharedPreferences.containsKey(playlistName)) {
      bool decision = await dialogWidget(
          context: context,
          title: 'This playlist already exists.',
          content: 'Do you want to overwriter the current playlist?');

      if (!decision) {
        Navigator.pop(context);
      }
      print(decision);
    }
  }
}
