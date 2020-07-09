import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlist/controller/playlist_controller.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlist/utils/widgets/create_playlist/create_playlist.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/button/button.dart';

class PlaylistPage extends StatefulWidget {
  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    final playlistController = PlayListController();
    final text = TextEditingController();

    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 0, 60),
            child: Text(
              'Playlist',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 48),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) => Container(),
            itemCount: 0,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Button(
            height: 52,
            width: 328,
            title: 'Create a new playlist',
            onPressed: () => showModalBottomSheet(
                context: context,
                builder: (_) => Observer(
                      builder: (_) => CreatePlaylist(
                        focusNode: playlistController.focusNode,
                        isFocus: playlistController.isFocus,
                      ),
                    ))),
        SizedBox(
          height: 60,
        )
      ],
    );
  }
}
