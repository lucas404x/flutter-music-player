import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/models/playlist.dart';

class PlaylistPage extends StatelessWidget {
  final Playlist playlist;

  PlaylistPage(this.playlist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(playlist.name.toString()),
      ),
    );
  }
}
