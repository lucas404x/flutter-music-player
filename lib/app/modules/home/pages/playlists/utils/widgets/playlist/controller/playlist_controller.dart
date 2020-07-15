import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlists/utils/widgets/select_songs/select_songs.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/dialog_widget/dialog_widget.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mobx/mobx.dart';
part 'playlist_controller.g.dart';

class PlaylistController = _PlaylistControllerBase with _$PlaylistController;

abstract class _PlaylistControllerBase with Store {
  ObservableList<Song> playlistSongs = ObservableList<Song>();

  String _playlistKey;

  List<String> _favorites;

  final playlistSongsKey = GlobalKey<AnimatedListState>();

  final _flutterSoundHelper = FlutterSoundHelper();

  _PlaylistControllerBase(String playlistKey) {
    _playlistKey = playlistKey;
    getPlaylistSongs();
  }

  @action
  Future<void> getPlaylistSongs() async {
    List<String> songs =
        await Modular.get<HomeStore>().getDataOnDisk(_playlistKey);

    songs.forEach((songPath) {
      _flutterSoundHelper.FFmpegGetMediaInformation(songPath)
          .then((value) async {
        Map data = {};

        data.addAll(value['metadata']);
        data['path'] = songPath;

        if (_favorites == null)
          _favorites = await Modular.get<HomeStore>()
              .getDataOnDisk(Constants.FAVORITE_KEY);

        if (_favorites.contains(data['path'])) {
          data['isFavorite'] = true;
        } else {
          data['isFavorite'] = false;
        }

        playlistSongs.add(Song.fromJson(data));

        if (playlistSongsKey.currentState != null)
          playlistSongsKey.currentState.insertItem(playlistSongs.length - 1);
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

  Future<void> removeSong(BuildContext context, Song song) async {
    bool decision = await dialogWidget(
        context: context,
        title: 'You will delete the ${song.name}.',
        content: 'Are you sure?',
        firstOption: FlatButton(
            onPressed: () => Navigator.pop(context, false), child: Text('No')),
        secondOption: FlatButton(
            onPressed: () => Navigator.pop(context, true), child: Text('Yes')));

    if (!decision) return;

    await Modular.get<HomeStore>().removeDataOnDisk(_playlistKey, song.path);

    int index = playlistSongs.indexOf(song);
    playlistSongs.removeAt(index);
    playlistSongsKey.currentState.removeItem(
        index,
        (context, animation) => Center(
              child: CircularProgressIndicator(),
            ));
  }
}
