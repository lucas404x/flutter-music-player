import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/pages/current_song/utils/widgets/progress_current_song/progress_current_song_controller.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ProgressCurrentSong extends StatelessWidget {
  final Duration duration;
  final Duration currentProgress;
  final Function innerWidget;

  ProgressCurrentSong(
      {@required this.duration,
      @required this.currentProgress,
      @required this.innerWidget});

  @override
  Widget build(BuildContext context) {
    final progressCurrentSongController = ProgressCurrentSongController();

    return SleekCircularSlider(
      innerWidget: innerWidget,
      onChangeEnd: progressCurrentSongController.onChangeEnd,
      appearance: CircularSliderAppearance(
          customWidths: CustomSliderWidths(
            progressBarWidth: 16.0,
          ),
          size: 330.0,
          startAngle: 270.0,
          angleRange: 360.0,
          customColors: CustomSliderColors(
            hideShadow: true,
            progressBarColors: [
              Constants.FIRST_MAIN_COLOR,
              Constants.SECOND_MAIN_COLOR
            ],
            trackColor: Constants.FIRST_MAIN_COLOR,
          )),
      initialValue: currentProgress.inSeconds.toDouble(),
      min: 0.0,
      max: duration == null
          ? currentProgress.inSeconds.toDouble() + 1.0
          : duration.inSeconds.toDouble(),
    );
  }
}
