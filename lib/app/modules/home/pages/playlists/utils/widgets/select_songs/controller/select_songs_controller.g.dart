// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_songs_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectSongsController on _SelectSongsControllerBase, Store {
  final _$selectedSongsIndexAtom =
      Atom(name: '_SelectSongsControllerBase.selectedSongsIndex');

  @override
  ObservableList<int> get selectedSongsIndex {
    _$selectedSongsIndexAtom.reportRead();
    return super.selectedSongsIndex;
  }

  @override
  set selectedSongsIndex(ObservableList<int> value) {
    _$selectedSongsIndexAtom.reportWrite(value, super.selectedSongsIndex, () {
      super.selectedSongsIndex = value;
    });
  }

  final _$_SelectSongsControllerBaseActionController =
      ActionController(name: '_SelectSongsControllerBase');

  @override
  dynamic getSongs() {
    final _$actionInfo = _$_SelectSongsControllerBaseActionController
        .startAction(name: '_SelectSongsControllerBase.getSongs');
    try {
      return super.getSongs();
    } finally {
      _$_SelectSongsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeState(bool state, int index) {
    final _$actionInfo = _$_SelectSongsControllerBaseActionController
        .startAction(name: '_SelectSongsControllerBase.changeState');
    try {
      return super.changeState(state, index);
    } finally {
      _$_SelectSongsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedSongsIndex: ${selectedSongsIndex}
    ''';
  }
}
