// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_feed_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BuildFeedViewModel on _FeedViewModelBase, Store {
  Computed<HouseModel?>? _$sliderHouseComputed;

  @override
  HouseModel? get sliderHouse =>
      (_$sliderHouseComputed ??= Computed<HouseModel?>(() => super.sliderHouse,
              name: '_FeedViewModelBase.sliderHouse'))
          .value;

  late final _$tabIndexAtom =
      Atom(name: '_FeedViewModelBase.tabIndex', context: context);

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FeedViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$houseModelsAtom =
      Atom(name: '_FeedViewModelBase.houseModels', context: context);

  @override
  List<HouseModel>? get houseModels {
    _$houseModelsAtom.reportRead();
    return super.houseModels;
  }

  @override
  set houseModels(List<HouseModel>? value) {
    _$houseModelsAtom.reportWrite(value, super.houseModels, () {
      super.houseModels = value;
    });
  }

  late final _$likedItemsAtom =
      Atom(name: '_FeedViewModelBase.likedItems', context: context);

  @override
  List<String> get likedItems {
    _$likedItemsAtom.reportRead();
    return super.likedItems;
  }

  @override
  set likedItems(List<String> value) {
    _$likedItemsAtom.reportWrite(value, super.likedItems, () {
      super.likedItems = value;
    });
  }

  late final _$getListAllAsyncAction =
      AsyncAction('_FeedViewModelBase.getListAll', context: context);

  @override
  Future getListAll() {
    return _$getListAllAsyncAction.run(() => super.getListAll());
  }

  late final _$_FeedViewModelBaseActionController =
      ActionController(name: '_FeedViewModelBase', context: context);

  @override
  void onLikeItemPressed(String? id) {
    final _$actionInfo = _$_FeedViewModelBaseActionController.startAction(
        name: '_FeedViewModelBase.onLikeItemPressed');
    try {
      return super.onLikeItemPressed(id);
    } finally {
      _$_FeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic tab2Change(int index) {
    final _$actionInfo = _$_FeedViewModelBaseActionController.startAction(
        name: '_FeedViewModelBase.tab2Change');
    try {
      return super.tab2Change(index);
    } finally {
      _$_FeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabIndex: ${tabIndex},
isLoading: ${isLoading},
houseModels: ${houseModels},
likedItems: ${likedItems},
sliderHouse: ${sliderHouse}
    ''';
  }
}
