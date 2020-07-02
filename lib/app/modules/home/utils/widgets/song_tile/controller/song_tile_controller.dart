import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/controller/home_controller.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:mobx/mobx.dart';
part 'song_tile_controller.g.dart';

class SongTileController = _SongTileControllerBase with _$SongTileController;

abstract class _SongTileControllerBase with Store {
  HomeStore _homeStore = Modular.get<HomeStore>();
  Function(String, int) get limitText => _homeStore.limitText;

  Song _song;

  _SongTileControllerBase(Song song) {
    _song = song;
  }

  void onTap() {
    _homeStore.song = _song;
    Modular.get<HomeController>().changeCurrentIndex(2);
  }
}
