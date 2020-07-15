// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlists_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaylistsController on _PlaylistsControllerBase, Store {
  final _$isFocusAtom = Atom(name: '_PlaylistsControllerBase.isFocus');

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

  final _$_PlaylistsControllerBaseActionController =
      ActionController(name: '_PlaylistsControllerBase');

  @override
  void focusChanged() {
    final _$actionInfo = _$_PlaylistsControllerBaseActionController.startAction(
        name: '_PlaylistsControllerBase.focusChanged');
    try {
      return super.focusChanged();
    } finally {
      _$_PlaylistsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFocus: ${isFocus}
    ''';
  }
}
