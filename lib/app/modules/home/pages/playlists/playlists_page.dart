import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/button/button.dart';

import 'controller/playlists_controller.dart';
import 'utils/widgets/create_playlist/create_playlist.dart';
import 'utils/widgets/playlist_card/playlist_card.dart';

class PlaylistsPage extends StatefulWidget {
  @override
  _PlaylistsPageState createState() => _PlaylistsPageState();
}

class _PlaylistsPageState extends State<PlaylistsPage> {
  @override
  Widget build(BuildContext context) {
    final playlistController = PlayListController();
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
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
          Observer(
            builder: (_) => playlistController.playlists != null
                ? Container(
                    width: size.width,
                    height: 250.0,
                    child: ListView(
                      children: playlistController.playlists
                          .map((playlist) => PlayListCard(playlist))
                          .toList(),
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                : Container(),
          ),
          SizedBox(
            height: 150,
          ),
          Button(
              height: 52,
              width: 328,
              title: 'Create a new playlist',
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (_) => Observer(
                        builder: (_) => CreatePlaylist(
                          textEditingController:
                              playlistController.textEditingController,
                          focusNode: playlistController.focusNode,
                          isFocus: playlistController.isFocus,
                        ),
                      ))),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
