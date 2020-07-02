import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:mobx/mobx.dart';
part 'progress_current_song_controller.g.dart';

class ProgressCurrentSongController = _ProgressCurrentSongControllerBase
    with _$ProgressCurrentSongController;

abstract class _ProgressCurrentSongControllerBase with Store {
  final _homeStore = Modular.get<HomeStore>();

  void onChangeEnd(double v) {
    _homeStore.audioPlayer.seek(Duration(seconds: v.round()));
  }
}
