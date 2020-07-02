import 'package:flutter/material.dart';

class Song {
  String name;
  String album;
  String path;
  bool isFavorite;
  int duration;

  Song(
      {@required this.name,
      @required this.album,
      @required this.path,
      @required this.isFavorite,
      @required this.duration});

  Song.fromJson(Map data) {
    name = data['title'];
    album = data['album'];
    path = data['path'];
    isFavorite = data['isFavorite'];
    duration = data['duration'];
  }
}
