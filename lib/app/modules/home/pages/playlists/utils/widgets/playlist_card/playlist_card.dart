import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/models/playlist.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlists/utils/widgets/playlist_card/controller/playlist_card_controller.dart';

class PlayListCard extends StatelessWidget {
  final Playlist playlist;

  PlayListCard(this.playlist);

  @override
  Widget build(BuildContext context) {
    final playlistCardController = PlaylistCardController(playlist);

    return InkWell(
      onTap: () => playlistCardController.onTap(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200.0,
          height: 187.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.7),
              border: Border.all(color: Colors.orange)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                playlist.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
