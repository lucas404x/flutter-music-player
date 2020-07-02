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

  final _$changeStateAsyncAction =
      AsyncAction('_HeartControllerBase.changeState');

  @override
  Future<void> changeState() {
    return _$changeStateAsyncAction.run(() => super.changeState());
  }

  @override
  String toString() {
    return '''
animation: ${animation}
    ''';
  }
}
