import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';

class Playlist {
  String name;
  List<Song> songs;

  Playlist({@required this.name, @required this.songs});
}
