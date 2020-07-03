import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/shuffle_button/shuffle_button.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/song_tile/song_tile_widget.dart';

import 'controller/song_list_controller.dart';

class SongListPage extends StatefulWidget {
  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  final songListController = SongListController();

  @override
  void dispose() {
    songListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: AnimatedList(
                controller: songListController.scrollController,
                key: songListController.songListKey,
                itemBuilder: (context, index, animation) {
                  return FadeTransition(
                    opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
                    child: SongTile(
                      song: songListController.songs[index],
                      songs: songListController.songs,
                    ),
                  );
                },
                initialItemCount: songListController.songs.length),
          )
        ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Observer(
                builder: (_) => AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: songListController.shuffleButtonOrNot,
                  child: ShuffleButton(
                    songs: songListController.songs,
                    activate: songListController.showButton,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        )
      ],
    );
  }
}
