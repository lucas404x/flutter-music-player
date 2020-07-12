import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/controller/home_controller.dart';
import 'package:flutter_music_player/app/modules/home/models/playlist.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlists/utils/widgets/playlist/playlist_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlists/utils/widgets/select_songs/select_songs.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mobx/mobx.dart';
part 'playlist_controller.g.dart';

class PlaylistController = _PlaylistControllerBase with _$PlaylistController;

abstract class _PlaylistControllerBase with Store {
  Playlist playlist;

  final _flutterSoundHelper = FlutterSoundHelper();

  Future<void> getPlaylistSongs() async {
    List<String> songs =
        await Modular.get<HomeStore>().getSongsOnDisk(playlist.name);

    songs.forEach((songPath) {
      _flutterSoundHelper.FFmpegGetMediaInformation(songPath).then((value) {
        Map data = {};

        data.addAll(value['metadata']);
        data['path'] = songPath;

        playlist.songs.add(Song.fromJson(data));
      });
    });
  }

  Future<void> addNewSong() async {
    List<String> selectedSongs =
        await Modular.to.push(MaterialPageRoute(builder: (_) => SelectSongs()));

    if (selectedSongs == null) return;

    selectedSongs.forEach((song) async {
      await Modular.get<HomeStore>().saveDataOnDisk(playlist.name, value: song);
    });

    Modular.get<HomeController>()
        .changeOtherPage(currentIndex: 1, page: PlaylistPage(playlist));
  }
}
