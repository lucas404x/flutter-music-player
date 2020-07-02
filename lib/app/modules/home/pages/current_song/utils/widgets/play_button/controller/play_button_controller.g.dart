// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_button_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayButtonController on _PlayButtonControllerBase, Store {
  final _$buttonAtom = Atom(name: '_PlayButtonControllerBase.button');

  @override
  String get button {
    _$buttonAtom.reportRead();
    return super.button;
  }

  @override
  set button(String value) {
    _$buttonAtom.reportWrite(value, super.button, () {
      super.button = value;
    });
  }

  final _$onTapAsyncAction = AsyncAction('_PlayButtonControllerBase.onTap');

  @override
  Future<void> onTap() {
    return _$onTapAsyncAction.run(() => super.onTap());
  }

  @override
  String toString() {
    return '''
button: ${button}
    ''';
  }
}
