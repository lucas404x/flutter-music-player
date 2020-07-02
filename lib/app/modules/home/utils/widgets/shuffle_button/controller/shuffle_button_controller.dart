import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/controller/home_controller.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:mobx/mobx.dart';
part 'shuffle_button_controller.g.dart';

class ShuffleButtonController = _ShuffleButtonControllerBase
    with _$ShuffleButtonController;

abstract class _ShuffleButtonControllerBase with Store {
  HomeStore _homeStore = Modular.get<HomeStore>();
  List<Song> _songs;
  bool _activate;

  _ShuffleButtonControllerBase(List<Song> songs, bool activate) {
    _songs = songs;
    _activate = activate;
  }

  void onTap() {
    _homeStore.songsMode = _songs;
    if (_activate) {
      _homeStore.getRandomSong();
    } else {
      _homeStore.song = _songs.last;
    }

    Modular.get<HomeController>().changeCurrentIndex(2);
  }
}
