import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/button/button.dart';

import 'controller/select_songs_controller.dart';

class SelectSongs extends StatefulWidget {
  @override
  _SelectSongsState createState() => _SelectSongsState();
}

class _SelectSongsState extends State<SelectSongs> {
  @override
  Widget build(BuildContext context) {
    final selectedSongsController = SelectSongsController();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Button(
              title: 'Add songs',
              width: (size.width / 2),
              height: 50.0,
              onPressed: selectedSongsController.finish),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: AnimatedList(
                key: selectedSongsController.animatedListKey,
                initialItemCount: selectedSongsController.songs.length,
                itemBuilder: (_, index, animation) => FadeTransition(
                      opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Observer(
                          builder: (_) => CheckboxListTile(
                            value: selectedSongsController.selectedSongsIndex
                                    .contains(index)
                                ? true
                                : false,
                            onChanged: (state) => selectedSongsController
                                .changeState(state, index),
                            title:
                                Text(selectedSongsController.songs[index].name),
                          ),
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
