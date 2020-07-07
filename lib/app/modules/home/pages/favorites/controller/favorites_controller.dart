import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mobx/mobx.dart';
part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesControllerBase with _$FavoritesController;

abstract class _FavoritesControllerBase with Store {
  final _flutterSoundHelper = FlutterSoundHelper();
  List<Song> favorites = [];

  final _songFavoriteKey = GlobalKey<AnimatedListState>();
  GlobalKey<AnimatedListState> get songFavoriteKey => _songFavoriteKey;

  final _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  @observable
  bool _showButton = true;
  @computed
  bool get showButton => _showButton;

  @computed
  double get shuffleButtonOrNot => _showButton ? 1.0 : 0.0;

  String filterText;

  _FavoritesControllerBase(filterText) {
    this.filterText = filterText;
    getSongs();
    _scrollController.addListener(_scrollControllerListener);
  }

  Future<void> getSongs() async {
    List<String> favoriteSongsPath =
        await Modular.get<HomeStore>().getSongsOnDisk(Constants.FAVORITE_KEY);

    if (favoriteSongsPath.length == 0) return;

    Map data = {};

    favoriteSongsPath.forEach((uri) {
      _flutterSoundHelper.FFmpegGetMediaInformation(uri).then((value) {
        data.addAll(value['metadata']);
        data['isFavorite'] = true;
        data['path'] = uri;

        favorites.add(Song.fromJson(data));

        if (_songFavoriteKey.currentState != null)
          _songFavoriteKey.currentState.insertItem(favorites.length - 1);

        data.clear();
      });
    });
  }

  void _scrollControllerListener() {
    print(_scrollController.position.maxScrollExtent);
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 10 ||
        favorites.length <= 1) {
      _changeShowButtonState(false);
    } else {
      _changeShowButtonState(true);
    }
  }

  @action
  void _changeShowButtonState(bool newState) {
    _showButton = newState;
  }

  bool showSong(Song song) {
    return song.name.toLowerCase().contains(filterText.toLowerCase());
  }

  void dispose() {
    _scrollController.dispose();
  }
}
