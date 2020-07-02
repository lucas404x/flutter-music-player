import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/button/button.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/shuffle_button/controller/shuffle_button_controller.dart';

class ShuffleButton extends StatelessWidget {
  final List<Song> songs;
  final bool activate;

  ShuffleButton({@required this.songs, @required this.activate});

  @override
  Widget build(BuildContext context) {
    final shuffleButtonController = ShuffleButtonController(songs, activate);

    return Button(
        title: 'SHUFFLE',
        width: 200.0,
        height: 50.0,
        onPressed: shuffleButtonController.onTap);
  }
}
