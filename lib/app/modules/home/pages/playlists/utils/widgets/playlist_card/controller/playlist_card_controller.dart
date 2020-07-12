import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/controller/home_controller.dart';
import 'package:flutter_music_player/app/modules/home/models/playlist.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlists/utils/widgets/playlist/playlist_page.dart';
import 'package:mobx/mobx.dart';
part 'playlist_card_controller.g.dart';

class PlaylistCardController = _PlaylistCardControllerBase
    with _$PlaylistCardController;

abstract class _PlaylistCardControllerBase with Store {
  String playlist;
  _PlaylistCardControllerBase(this.playlist);

  void onTap(BuildContext context) {
    Modular.get<HomeController>().changeOtherPage(
        page: PlaylistPage(Playlist(name: playlist, songs: [])),
        currentIndex: 1);
  }
}
