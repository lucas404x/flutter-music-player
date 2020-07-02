import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/shared/constants/animations.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'heart_controller.g.dart';

class HeartController = _HeartControllerBase with _$HeartController;

abstract class _HeartControllerBase with Store {
  @observable
  String animation;

  HomeStore _homeStore = Modular.get<HomeStore>();

  bool isPaused = true;
  Song song;

  _HeartControllerBase(Song song) {
    this.song = song;
    animation = song.isFavorite
        ? Animations.HEART_DEACTIVATE_ANIMATION
        : Animations.HEART_ACTIVATE_ANIMATION;
  }

  @action
  Future<void> changeState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> favorites = await _homeStore.getFavoriteSongs();

    if (song.isFavorite) {
      song.isFavorite = false;
      animation = Animations.HEART_DEACTIVATE_ANIMATION;
      favorites.remove(song.path);
    } else {
      song.isFavorite = true;
      animation = Animations.HEART_ACTIVATE_ANIMATION;
      favorites.add(song.path);
    }

    _homeStore.changeFavoriteState(song);

    isPaused = false;
    await sharedPreferences.setStringList(Constants.FAVORITE_KEY, favorites);
  }
}
