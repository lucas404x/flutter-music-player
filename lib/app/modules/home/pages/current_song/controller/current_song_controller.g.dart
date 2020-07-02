// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_song_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CurrentSongController on _CurrentSongControllerBase, Store {
  Computed<Duration> _$currentDurationComputed;

  @override
  Duration get currentDuration => (_$currentDurationComputed ??=
          Computed<Duration>(() => super.currentDuration,
              name: '_CurrentSongControllerBase.currentDuration'))
      .value;

  final _$_currentDurationAtom =
      Atom(name: '_CurrentSongControllerBase._currentDuration');

  @override
  Duration get _currentDuration {
    _$_currentDurationAtom.reportRead();
    return super._currentDuration;
  }

  @override
  set _currentDuration(Duration value) {
    _$_currentDurationAtom.reportWrite(value, super._currentDuration, () {
      super._currentDuration = value;
    });
  }

  final _$_CurrentSongControllerBaseActionController =
      ActionController(name: '_CurrentSongControllerBase');

  @override
  dynamic getProgress() {
    final _$actionInfo = _$_CurrentSongControllerBaseActionController
        .startAction(name: '_CurrentSongControllerBase.getProgress');
    try {
      return super.getProgress();
    } finally {
      _$_CurrentSongControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentDuration: ${currentDuration}
    ''';
  }
}
