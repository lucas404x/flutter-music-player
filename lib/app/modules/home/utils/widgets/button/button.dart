import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/constants.dart';

class Button extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Function onPressed;

  Button(
      {@required this.title,
      @required this.width,
      @required this.height,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 4))
            ],
            borderRadius: BorderRadius.circular(35),
            gradient: LinearGradient(colors: [
              Constants.FIRST_MAIN_COLOR,
              Constants.SECOND_MAIN_COLOR
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        width: width,
        height: height,
      ),
    );
  }
}
