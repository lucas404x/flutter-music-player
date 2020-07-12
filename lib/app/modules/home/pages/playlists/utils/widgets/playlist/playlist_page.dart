import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/models/playlist.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/button/button.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/song_tile/song_tile_widget.dart';

class PlaylistPage extends StatelessWidget {
  final Playlist playlist;

  PlaylistPage(this.playlist);

  @override
  Widget build(BuildContext context) {
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
          playlist.name,
          style: TextStyle(fontSize: (36.0 - playlist.name.length)),
        ),
        Text(
          playlist.songs.length > 1
              ? playlist.songs.length.toString()
              : '0' + playlist.songs.length.toString(),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: playlist.songs.length + 1,
                itemBuilder: (_, index) => index == playlist.songs.length + 1
                    ? SongTile(
                        songs: playlist.songs, song: playlist.songs[index])
                    : Button(
                        title: 'Add new song',
                        width: 328,
                        height: 52,
                        onPressed: () {})),
          ),
        )
      ],
    );
  }
}
