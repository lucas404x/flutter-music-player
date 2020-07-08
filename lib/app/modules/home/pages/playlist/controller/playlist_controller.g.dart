// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayListController on _PlayListControllerBase, Store {
  final _$heightScreenAtom = Atom(name: '_PlayListControllerBase.heightScreen');

  @override
  double get heightScreen {
    _$heightScreenAtom.reportRead();
    return super.heightScreen;
  }

  @override
  set heightScreen(double value) {
    _$heightScreenAtom.reportWrite(value, super.heightScreen, () {
      super.heightScreen = value;
    });
  }

  final _$_PlayListControllerBaseActionController =
      ActionController(name: '_PlayListControllerBase');

  @override
  void onTapTextField() {
    final _$actionInfo = _$_PlayListControllerBaseActionController.startAction(
        name: '_PlayListControllerBase.onTapTextField');
    try {
      return super.onTapTextField();
    } finally {
      _$_PlayListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
heightScreen: ${heightScreen}
    ''';
  }
}
