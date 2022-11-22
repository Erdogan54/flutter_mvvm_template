// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_board_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnBoardViewModel on _OnBoardViewModelBase, Store {
  late final _$isLodingAtom =
      Atom(name: '_OnBoardViewModelBase.isLoding', context: context);

  @override
  bool get isLoding {
    _$isLodingAtom.reportRead();
    return super.isLoding;
  }

  @override
  set isLoding(bool value) {
    _$isLodingAtom.reportWrite(value, super.isLoding, () {
      super.isLoding = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_OnBoardViewModelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$_OnBoardViewModelBaseActionController =
      ActionController(name: '_OnBoardViewModelBase', context: context);

  @override
  dynamic changeCurrentIndex(int index) {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.changeCurrentIndex');
    try {
      return super.changeCurrentIndex(index);
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoding() {
    final _$actionInfo = _$_OnBoardViewModelBaseActionController.startAction(
        name: '_OnBoardViewModelBase.changeLoding');
    try {
      return super.changeLoding();
    } finally {
      _$_OnBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoding: ${isLoding},
currentIndex: ${currentIndex}
    ''';
  }
}
