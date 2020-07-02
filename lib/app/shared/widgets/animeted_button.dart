import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AnimatedButton extends StatelessWidget {
  final String path;
  final String animation;
  final double width;
  final double height;
  final bool isPaused;
  final Function onTap;

  AnimatedButton(
      {@required this.path,
      @required this.animation,
      @required this.width,
      @required this.height,
      @required this.isPaused,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          child: FlareActor(
            path,
            animation: animation,
            isPaused: isPaused,
          )),
    );
  }
}
