// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayListController on _PlayListControllerBase, Store {
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
isFocus: ${isFocus}
    ''';
  }
}
