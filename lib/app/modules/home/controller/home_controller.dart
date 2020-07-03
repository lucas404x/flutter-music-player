import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/pages/current_song/current_song_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/favorites/favorites_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlist/playlist_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/settings/settings_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/song_list/song_list_page.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int _currentIndex = 0;

  @computed
  int get currentIndex => _currentIndex;

  bool get showAppBar =>
      (currentIndex == 2 || currentIndex == 4) ? false : true;

  Widget _songListPage = SongListPage();
  Widget _playlistPage = PlaylistPage();
  Widget _currentSongPage = CurrentSongPage();
  Widget _favoritesPage = FavoritesPage();
  Widget _settingsPage = SettingsPage();

  bool _isRestart = false;

  Widget get currentPage {
    switch (_currentIndex) {
      case 0:
        return _songListPage;
        break;
      case 1:
        return _playlistPage;
        break;
      case 2:
        if (_isRestart) {
          _currentSongPage = CurrentSongPage();
        }

        return _currentSongPage;
        break;
      case 3:
        return _favoritesPage;
        break;
      case 4:
        return _settingsPage;
        break;
      default:
        return null;
    }
  }

  @action
  void changeCurrentIndex(int newCurrentIndex, {bool isRestart = false}) {
    _isRestart = isRestart;
    _currentIndex = newCurrentIndex;
  }
}
