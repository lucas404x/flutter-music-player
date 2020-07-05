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
  List<Song> _songsMode;

  bool get isCurrentSong =>
      _homeStore.song != null && _homeStore.song.path == _song.path;

  _SongTileControllerBase(Song song, List<Song> songsMode) {
    _song = song;
    _songsMode = songsMode;
  }

  void onTap() {
    _homeStore.song = _song;
    _homeStore.songsMode = _songsMode;
    Modular.get<HomeController>().changeCurrentIndex(2);
  }
}
