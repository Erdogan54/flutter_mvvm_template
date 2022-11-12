import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';

import '../model/on_board_model.dart';
part 'on_board_view-model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => baseContext = context;
  List<OnBoardModel>? onBoardModels;
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
