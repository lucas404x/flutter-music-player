import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/home_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlist/controller/playlist_controller.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';

import 'controller/home_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => PlayListController()),
        Bind((i) => HomeStore(i.args.data)),
      ];

  @override
  List<Router> get routers => [
        Router('/home', child: (_, args) => HomePage()),
      ];
}
