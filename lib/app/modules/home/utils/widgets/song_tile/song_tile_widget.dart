import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/heart/heart.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/song_tile/controller/song_tile_controller.dart';

class SongTile extends StatelessWidget {
  final List<Song> songs;
  final Song song;

  SongTile({@required this.songs, @required this.song});

  @override
  Widget build(BuildContext context) {
    final songTileController = SongTileController(song, songs);

    return GestureDetector(
        onTap: songTileController.onTap,
        child: Container(
          padding: EdgeInsets.all(14),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  songTileController.limitText(song.name, 42),
                  style: TextStyle(fontSize: 13),
                ),
                Heart(song: song, width: 60, height: 120),
              ],
            ),
            height: 65,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10.0,
                      offset: Offset(0, 4))
                ]),
          ),
        ));
  }
}
