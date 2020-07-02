import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/pages/current_song/utils/constants/constants.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:mobx/mobx.dart';
part 'play_button_controller.g.dart';

class PlayButtonController = _PlayButtonControllerBase
    with _$PlayButtonController;

abstract class _PlayButtonControllerBase with Store {
  final _homeStore = Modular.get<HomeStore>();

  @observable
  String button = Constants.PAUSE_PATH;

  @action
  Future<void> onTap() async {
    if (button == Constants.PLAY_PATH) {
      await _homeStore.audioPlayer.play(_homeStore.song.path, isLocal: true);
      button = Constants.PAUSE_PATH;
    } else {
      await _homeStore.audioPlayer.pause();
      button = Constants.PLAY_PATH;
    }
  }
}
