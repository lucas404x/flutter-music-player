import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/controller/home_controller.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlists/utils/widgets/playlist/playlist_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlists/utils/widgets/select_songs/select_songs.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mobx/mobx.dart';
part 'playlist_controller.g.dart';

class PlaylistController = _PlaylistControllerBase with _$PlaylistController;

abstract class _PlaylistControllerBase with Store {
  @observable
  ObservableList<Song> playlistSongs = ObservableList<Song>();

  String _playlistKey;

  List<String> _favorites;

  final _flutterSoundHelper = FlutterSoundHelper();

  _PlaylistControllerBase(String playlistKey) {
    _playlistKey = playlistKey;
    getPlaylistSongs();
  }

  @action
  Future<void> getPlaylistSongs() async {
    List<String> songs =
        await Modular.get<HomeStore>().getSongsOnDisk(_playlistKey);

    songs.forEach((songPath) {
      _flutterSoundHelper.FFmpegGetMediaInformation(songPath)
          .then((value) async {
        Map data = {};

        data.addAll(value['metadata']);
        data['path'] = songPath;

        if (_favorites == null)
          _favorites = await Modular.get<HomeStore>()
              .getSongsOnDisk(Constants.FAVORITE_KEY);

        if (_favorites.contains(data['path'])) {
          data['isFavorite'] = true;
        } else {
          data['isFavorite'] = false;
        }

        playlistSongs.add(Song.fromJson(data));
      });
    });
  }

  Future<void> addNewSong() async {
    List<String> selectedSongs =
        await Modular.to.push(MaterialPageRoute(builder: (_) => SelectSongs()));

    if (selectedSongs == null) return;

    selectedSongs.forEach((song) async {
      await Modular.get<HomeStore>().saveDataOnDisk(_playlistKey, value: song);
    });
  }
}
