// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<int> _$currentIndexComputed;

  @override
  int get currentIndex =>
      (_$currentIndexComputed ??= Computed<int>(() => super.currentIndex,
              name: '_HomeControllerBase.currentIndex'))
          .value;
  Computed<OrderBy> _$dropDownValueComputed;

  @override
  OrderBy get dropDownValue =>
      (_$dropDownValueComputed ??= Computed<OrderBy>(() => super.dropDownValue,
              name: '_HomeControllerBase.dropDownValue'))
          .value;

  final _$_currentIndexAtom = Atom(name: '_HomeControllerBase._currentIndex');

  @override
  int get _currentIndex {
    _$_currentIndexAtom.reportRead();
    return super._currentIndex;
  }

  @override
  set _currentIndex(int value) {
    _$_currentIndexAtom.reportWrite(value, super._currentIndex, () {
      super._currentIndex = value;
    });
  }

  final _$_dropDownValueAtom = Atom(name: '_HomeControllerBase._dropDownValue');

  @override
  OrderBy get _dropDownValue {
    _$_dropDownValueAtom.reportRead();
    return super._dropDownValue;
  }

  @override
  set _dropDownValue(OrderBy value) {
    _$_dropDownValueAtom.reportWrite(value, super._dropDownValue, () {
      super._dropDownValue = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void changeCurrentIndex(int newCurrentIndex, {bool isRestart = false}) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeCurrentIndex');
    try {
      return super.changeCurrentIndex(newCurrentIndex, isRestart: isRestart);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChanged(OrderBy orderBy) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.onChanged');
    try {
      return super.onChanged(orderBy);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
dropDownValue: ${dropDownValue}
    ''';
  }
}
