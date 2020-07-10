import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/home_page.dart';
import 'package:flutter_music_player/app/modules/home/pages/current_song/controller/current_song_controller.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlists/controller/playlists_controller.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';

import 'controller/home_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => HomeStore(i.args.data)),
        Bind((i) => PlaylistsController(), singleton: false),
        Bind((i) => CurrentSongController(), singleton: false),
      ];

  @override
  List<Router> get routers => [
        Router('/home', child: (_, args) => HomePage()),
      ];
}
