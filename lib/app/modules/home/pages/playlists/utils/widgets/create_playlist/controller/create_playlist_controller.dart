import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/controller/home_controller.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/dialog_widget/dialog_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'create_playlist_controller.g.dart';

class CreatePlaylistController = _CreatePlaylistControllerBase
    with _$CreatePlaylistController;

abstract class _CreatePlaylistControllerBase with Store {
  bool _isFocus;
  TextEditingController textEditingController;

  double _heightScreenWithFocusOn;
  double _heightScreenWithFocusOff;

  set heightScreen(double heightScreen) {
    _heightScreenWithFocusOn = heightScreen;
    _heightScreenWithFocusOff = heightScreen * 0.26;
  }

  double get heightScreen =>
      _isFocus ? _heightScreenWithFocusOn : _heightScreenWithFocusOff;

  _CreatePlaylistControllerBase(this._isFocus, this.textEditingController);

  Future<void> createPlaylist(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String playlistName = textEditingController.text.trim();
    textEditingController.text = '';

    if (playlistName == '') return;
    if (_isKeyName(playlistName))
      playlistName = _toUpperFirstChar(playlistName);

    if (playlistName == '') return;

    if (sharedPreferences.containsKey(playlistName)) {
      bool decision = await dialogWidget(
          context: context,
          title: 'This playlist already exists.',
          content: 'Do you want to overwriter the current playlist?');

      if (!decision) {
        Navigator.pop(context);
        return;
      }
    }

    await Modular.get<HomeStore>().saveDataOnDisk(playlistName);
    await Modular.get<HomeStore>()
        .saveDataOnDisk(Constants.PLAYLIST_KEY, value: playlistName);

    Navigator.pop(context);
    Modular.get<HomeController>().changeCurrentIndex(1, isRestart: true);
  }

  bool _isKeyName(String playlistName) {
    List<String> keys = [Constants.FAVORITE_KEY, Constants.PLAYLIST_KEY];

    for (String key in keys) {
      if (playlistName == key) return true;
    }

    return false;
  }

  String _toUpperFirstChar(String playlistName) {
    String upperChar = playlistName.substring(0, 1).toUpperCase();
    return playlistName.replaceFirst(RegExp(r'.'), upperChar);
  }
}
