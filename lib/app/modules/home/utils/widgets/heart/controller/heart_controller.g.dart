// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HeartController on _HeartControllerBase, Store {
  final _$animationAtom = Atom(name: '_HeartControllerBase.animation');

  @override
  String get animation {
    _$animationAtom.reportRead();
    return super.animation;
  }

  @override
  set animation(String value) {
    _$animationAtom.reportWrite(value, super.animation, () {
      super.animation = value;
    });
  }

  final _$_HeartControllerBaseActionController =
      ActionController(name: '_HeartControllerBase');

  @override
  void changeState() {
    final _$actionInfo = _$_HeartControllerBaseActionController.startAction(
        name: '_HeartControllerBase.changeState');
    try {
      return super.changeState();
    } finally {
      _$_HeartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animation: ${animation}
    ''';
  }
}
