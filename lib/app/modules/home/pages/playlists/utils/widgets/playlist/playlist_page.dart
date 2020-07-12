import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlists/utils/widgets/playlist/controller/playlist_controller.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/button/button.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/song_tile/song_tile_widget.dart';

class PlaylistPage extends StatelessWidget {
  final String playlist;

  PlaylistPage(this.playlist);

  @override
  Widget build(BuildContext context) {
    final playlistController = PlaylistController(playlist);

    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 38.0),
          child: Container(
            width: 162.0,
            height: 162.0,
            decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
          ),
        ),
        Text(
          playlist,
          style: TextStyle(
              fontSize: (36.0 - playlistController.playlistSongs.length)),
        ),
        Text(
          playlistController.playlistSongs.length > 1
              ? playlistController.playlistSongs.length.toString()
              : '0' + playlistController.playlistSongs.length.toString(),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: playlistController.playlistSongs.length + 1,
                itemBuilder: (_, index) => index == playlist.length + 1
                    ? SongTile(
                        songs: playlistController.playlistSongs,
                        song: playlistController.playlistSongs[index])
                    : Button(
                        title: 'Add new song',
                        width: 328,
                        height: 52,
                        onPressed: playlistController.addNewSong)),
          ),
        )
      ],
    );
  }
}
