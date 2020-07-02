// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesController on _FavoritesControllerBase, Store {
  Computed<bool> _$showButtonComputed;

  @override
  bool get showButton =>
      (_$showButtonComputed ??= Computed<bool>(() => super.showButton,
              name: '_FavoritesControllerBase.showButton'))
          .value;
  Computed<double> _$shuffleButtonOrNotComputed;

  @override
  double get shuffleButtonOrNot => (_$shuffleButtonOrNotComputed ??=
          Computed<double>(() => super.shuffleButtonOrNot,
              name: '_FavoritesControllerBase.shuffleButtonOrNot'))
      .value;

  final _$_showButtonAtom = Atom(name: '_FavoritesControllerBase._showButton');

  @override
  bool get _showButton {
    _$_showButtonAtom.reportRead();
    return super._showButton;
  }

  @override
  set _showButton(bool value) {
    _$_showButtonAtom.reportWrite(value, super._showButton, () {
      super._showButton = value;
    });
  }

  final _$_FavoritesControllerBaseActionController =
      ActionController(name: '_FavoritesControllerBase');

  @override
  void _changeShowButtonState(bool newState) {
    final _$actionInfo = _$_FavoritesControllerBaseActionController.startAction(
        name: '_FavoritesControllerBase._changeShowButtonState');
    try {
      return super._changeShowButtonState(newState);
    } finally {
      _$_FavoritesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showButton: ${showButton},
shuffleButtonOrNot: ${shuffleButtonOrNot}
    ''';
  }
}
