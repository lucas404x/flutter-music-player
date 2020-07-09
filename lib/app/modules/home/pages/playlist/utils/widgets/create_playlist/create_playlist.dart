import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlist/utils/widgets/create_playlist/controller/create_playlist_controller.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/button/button.dart';

class CreatePlaylist extends StatelessWidget {
  final FocusNode focusNode;
  final bool isFocus;

  CreatePlaylist({@required this.focusNode, @required this.isFocus});

  @override
  Widget build(BuildContext context) {
    final createPlaylistController = CreatePlaylistController(isFocus);
    createPlaylistController.heightScreen = MediaQuery.of(context).size.height;

    return Container(
      height: createPlaylistController.heightScreen,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: createPlaylistController.textEditingController,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: 'Playlist name',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Button(
            title: 'Create playlist',
            height: 40,
            width: 300,
            onPressed: () => createPlaylistController.createPlaylist(context),
          ),
          SizedBox(
            height: 1,
          )
        ],
      ),
    );
  }
}
