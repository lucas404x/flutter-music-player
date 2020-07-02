import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/get_folder/utils/constant/get_folder_constant.dart';
import 'package:flutter_music_player/app/shared/widgets/animeted_button.dart';

import 'controller/get_folder_controller.dart';

class GetFolderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getFolderController = GetFolderController();

    return Scaffold(
        body: Center(
            child: AnimatedButton(
      isPaused: false,
      width: Constants.BUTTON_WIDTH,
      height: Constants.BUTTON_HEIGHT,
      path: Constants.PATH,
      animation: Constants.ANIMATION,
      onTap: getFolderController.getFolder,
    )));
  }
}
