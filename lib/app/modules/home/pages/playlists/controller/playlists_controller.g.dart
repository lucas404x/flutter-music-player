// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlists_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaylistsController on _PlaylistsControllerBase, Store {
  final _$isFocusAtom = Atom(name: '_PlayListControllerBase.isFocus');

  @override
  bool get isFocus {
    _$isFocusAtom.reportRead();
    return super.isFocus;
  }

  @override
  set isFocus(bool value) {
    _$isFocusAtom.reportWrite(value, super.isFocus, () {
      super.isFocus = value;
    });
  }

  final _$playlistsAtom = Atom(name: '_PlayListControllerBase.playlists');

  @override
  ObservableList<Playlist> get playlists {
    _$playlistsAtom.reportRead();
    return super.playlists;
  }

  @override
  set playlists(ObservableList<Playlist> value) {
    _$playlistsAtom.reportWrite(value, super.playlists, () {
      super.playlists = value;
    });
  }

  final _$getPlaylistsAsyncAction =
      AsyncAction('_PlayListControllerBase.getPlaylists');

  @override
  Future<void> getPlaylists() {
    return _$getPlaylistsAsyncAction.run(() => super.getPlaylists());
  }

  final _$_PlayListControllerBaseActionController =
      ActionController(name: '_PlayListControllerBase');

  @override
  void focusChanged() {
    final _$actionInfo = _$_PlayListControllerBaseActionController.startAction(
        name: '_PlayListControllerBase.focusChanged');
    try {
      return super.focusChanged();
    } finally {
      _$_PlayListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFocus: ${isFocus},
playlists: ${playlists}
    ''';
  }
}
