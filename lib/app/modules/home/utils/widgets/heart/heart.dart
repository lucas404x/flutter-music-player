import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/heart/controller/heart_controller.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/shared/constants/animations.dart';
import 'package:flutter_music_player/app/shared/widgets/animeted_button.dart';

class Heart extends StatelessWidget {
  final double width;
  final double height;
  final Song song;

  Heart({@required this.width, @required this.height, @required this.song});

  @override
  Widget build(BuildContext context) {
    final heartController = HeartController(song);

    return Observer(
      builder: (_) => AnimatedButton(
        width: width,
        height: height,
        animation: heartController.animation,
        path: Animations.HEART_PATH,
        onTap: heartController.changeState,
        isPaused: heartController.isPaused,
      ),
    );
  }
}
