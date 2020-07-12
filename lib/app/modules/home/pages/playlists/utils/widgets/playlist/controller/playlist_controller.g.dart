// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaylistController on _PlaylistControllerBase, Store {
  final _$playlistSongsAtom =
      Atom(name: '_PlaylistControllerBase.playlistSongs');

  @override
  ObservableList<Song> get playlistSongs {
    _$playlistSongsAtom.reportRead();
    return super.playlistSongs;
  }

  @override
  set playlistSongs(ObservableList<Song> value) {
    _$playlistSongsAtom.reportWrite(value, super.playlistSongs, () {
      super.playlistSongs = value;
    });
  }

  @override
  String toString() {
    return '''
playlistSongs: ${playlistSongs}
    ''';
  }
}
