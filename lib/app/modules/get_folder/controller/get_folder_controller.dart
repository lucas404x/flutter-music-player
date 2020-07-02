import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/get_folder/utils/constant/get_folder_constant.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'get_folder_controller.g.dart';

class GetFolderController = _GetFolderControllerBase with _$GetFolderController;

abstract class _GetFolderControllerBase with Store {
  _GetFolderControllerBase() {
    _getPath().then((directory) {
      if (directory != null) {
        _toHomePage(Directory(directory));
      }
    });
  }

  void getFolder() {
    _getPermission().then((permission) async {
      if (permission) {
        _makeAction(await FilePicker.getDirectoryPath());
      }
    });
  }
}

Future<bool> _getPermission() async {
  await Permission.storage.request();
  return Permission.storage.isGranted;
}

Future<String> _getPath() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getString(Constants.DIRECTORY_KEY);
}

void _makeAction(String path) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString(Constants.DIRECTORY_KEY, path);
  _toHomePage(Directory(path));
}

_toHomePage(Directory directory) {
  Modular.to.pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'),
      arguments: directory);
}
