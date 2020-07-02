import 'package:flutter/material.dart';

class Song {
  String name;
  String album;
  String path;
  bool isFavorite;

  Song(
      {@required this.name,
      @required this.album,
      @required this.path,
      @required this.isFavorite});

  Song.fromJson(Map data) {
    name = data['title'];
    album = data['album'];
    path = data['path'];
    isFavorite = data['isFavorite'];
  }
}
