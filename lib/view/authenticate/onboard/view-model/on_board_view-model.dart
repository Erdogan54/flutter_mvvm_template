import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/extension/context_extension.dart';
import '../model/on_board_model.dart';
part 'on_board_view-model.g.dart';

// ignore: library_private_types_in_public_api
class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => contextMy = context;
  List<OnBoardModel>? onBoardModels;
  @override
  void init() {
    onBoardModels = List.generate(5, (index) => OnBoardModel("$index"));
  }

  @observable
  int currentPageIndex = 0;

  @action
  onPageChanged(int value) {
    currentPageIndex = value;
  }

 
}
