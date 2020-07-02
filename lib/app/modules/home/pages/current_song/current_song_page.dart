import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music_player/app/modules/home/pages/current_song/controller/current_song_controller.dart';
import 'package:flutter_music_player/app/modules/home/pages/current_song/utils/widgets/progress_current_song/progress_current_song.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/heart/heart.dart';

class CurrentSongPage extends StatefulWidget {
  @override
  _CurrentSongPageState createState() => _CurrentSongPageState();
}

class _CurrentSongPageState extends State<CurrentSongPage> {
  @override
  Widget build(BuildContext context) {
    final currentSongController = CurrentSongController();

    return currentSongController.song != null
        ? Column(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Heart(
                  song: currentSongController.song,
                  width: 90,
                  height: 70,
                ),
              ],
            ),
            Observer(builder: (_) {
              if (currentSongController.currentDuration != null) {
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      ProgressCurrentSong(
                        innerWidget: currentSongController.innerWidget,
                        duration: currentSongController.songDuration,
                        currentProgress: currentSongController.currentDuration,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        currentSongController.limitText(
                            currentSongController.song.name, 150),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        softWrap: true,
                      ),
                      Text(
                        currentSongController.currentProgressFormated(
                            currentSongController.currentDuration),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w200),
                        strutStyle: StrutStyle(fontSize: 20),
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            })
          ])
        : Center(
            child: Text(
              'No song playing yet.',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(0.6)),
            ),
          );
  }
}
