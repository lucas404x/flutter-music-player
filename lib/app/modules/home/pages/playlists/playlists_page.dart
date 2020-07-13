import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
    final playlistController = Modular.get<PlaylistsController>();
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
          Container(
            width: size.width,
            height: 250.0,
            child: AnimatedList(
              scrollDirection: Axis.horizontal,
              key: playlistController.playlistKey,
              initialItemCount: playlistController.playlists.length,
              itemBuilder: (_, index, animation) => FadeTransition(
                opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
                child: PlayListCard(
                  playlist: playlistController.playlists[index],
                  onLongPress: playlistController.removePlaylist,
                ),
              ),
            ),
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
