import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/models/playlist.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mobx/mobx.dart';
part 'playlists_controller.g.dart';

class PlayListController = _PlayListControllerBase with _$PlayListController;

abstract class _PlayListControllerBase with Store {
  @observable
  bool isFocus = false;

  @observable
  ObservableList<Playlist> playlists = ObservableList<Playlist>();

  final focusNode = FocusNode();
  final textEditingController = TextEditingController();

  final _flutterSoundHelper = FlutterSoundHelper();

  _PlayListControllerBase() {
    getPlaylists();
    focusNode.addListener(focusChanged);
  }

  @action
  Future<void> getPlaylists() async {
    List<String> playlistsName =
        await Modular.get<HomeStore>().getSongsOnDisk(Constants.PLAYLIST_KEY);

    playlistsName.forEach((playlistName) async {
      List<Song> songs = [];
      List<String> songsPath =
          await Modular.get<HomeStore>().getSongsOnDisk(playlistName);

      songsPath.forEach((songPath) {
        _flutterSoundHelper.FFmpegGetMediaInformation(songPath).then((value) {
          Map data = {};

          data.addAll(value['metadata']);
          data['path'] = songPath;

          songs.add(Song.fromJson(data));
        });
      });

      playlists.add(Playlist(name: playlistName, songs: songs));
    });
  }

  @action
  void focusChanged() {
    isFocus = focusNode.hasFocus;
  }
}
