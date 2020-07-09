import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/models/playlist.dart';

class PlayListCard extends StatelessWidget {
  final Playlist playlist;

  PlayListCard(this.playlist);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.5,
      height: 187.0,
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              playlist.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
