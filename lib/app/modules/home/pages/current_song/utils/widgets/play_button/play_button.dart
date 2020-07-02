import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'controller/play_button_controller.dart';

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final playButtonController = PlayButtonController();
    return Observer(
      builder: (_) => GestureDetector(
        child: Image.asset(playButtonController.button),
        onTap: playButtonController.onTap,
      ),
    );
  }
}
