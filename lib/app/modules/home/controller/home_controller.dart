import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/pages/current_song/current_song_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/favorites/favorites_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlists/playlists_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/settings/settings_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/song_list/song_list_page.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
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
  Widget _playlistPage = PlaylistsPage();
  Widget _currentSongPage = CurrentSongPage();
  Widget _favoritesPage = FavoritesPage();
  Widget _settingsPage = SettingsPage();

  Widget _otherPage;

  bool _isRestart = false;

  Widget get currentPage {
    if (_otherPage != null) return _otherPage;

    switch (_currentIndex) {
      case 0:
        if (_isRestart) {
          _songListPage = SongListPage();
        }
        return _songListPage;
        break;
      case 1:
        if (_isRestart) {
          _playlistPage = PlaylistsPage();
        }
        return _playlistPage;
        break;
      case 2:
        if (_isRestart) {
          _currentSongPage = CurrentSongPage();
        }

        return _currentSongPage;
        break;
      case 3:
        if (_isRestart) {
          _favoritesPage = FavoritesPage();
        }
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
    _otherPage = null;
  }

  @action
  void changeOtherPage({@required Widget page, @required int currentIndex}) {
    /*
    This method show another page without put over of Navigator.

    page: the page reference.
    currentIndex: the tab where will go to show.
    */

    _currentIndex = currentIndex;
    _otherPage = page;
  }

  dispose() async {
    if (Modular.get<HomeStore>().audioPlayer != null) {
      await Modular.get<HomeStore>().dispose();
    }
  }
}
