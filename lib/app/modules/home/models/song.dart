import 'package:flutter/material.dart';

class Song {
  String name;
  String path;
  bool isFavorite;

  Song({@required this.name, @required this.path, @required this.isFavorite});

  Song.fromJson(Map data) {
    name = data['title'];
    path = data['path'];
    isFavorite = data['isFavorite'];
  }
}
