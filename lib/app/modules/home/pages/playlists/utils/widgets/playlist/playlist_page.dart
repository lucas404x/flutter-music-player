import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlists/utils/widgets/playlist/controller/playlist_controller.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/song_tile/song_tile_widget.dart';

class PlaylistPage extends StatefulWidget {
  final String playlist;

  PlaylistPage(this.playlist);

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    final playlistController = PlaylistController(widget.playlist);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await playlistController.addNewSong();
          setState(() {});
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 38.0),
            child: Container(
              width: 162.0,
              height: 162.0,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.orange)),
            ),
          ),
          Text(
            widget.playlist,
            style: TextStyle(fontSize: (36.0 - widget.playlist.length)),
          ),
          Observer(
            builder: (_) => Text(
              playlistController.playlistSongs.length.toString(),
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                  itemCount: playlistController.playlistSongs.length,
                  itemBuilder: (_, index) => SongTile(
                      songs: playlistController.playlistSongs,
                      song: playlistController.playlistSongs[index])),
            ),
          ),
        ],
      ),
    );
  }
}
