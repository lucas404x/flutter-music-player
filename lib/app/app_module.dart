import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/app_widget.dart';
import 'package:flutter_music_player/app/modules/get_folder/get_folder_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: GetFolderModule()),
        Router('/home', module: HomeModule())
      ];

  @override
  Widget get bootstrap => AppWidget();
}
