// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_constants/image_path_svg.dart';
import '../model/on_board_model.dart';

part 'on_board_viewmodel.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  late BuildContext baseContext;
  @override
  void setContext(BuildContext context) => baseContext = context;
  @override
  void init() {
    onBoardItems.add(OnBoardModel(
      title: LocaleKeys.onBoard_page1_title,
      decription: LocaleKeys.onBoard_page1_desc.locale,
      imagePath: SVGImagePaths.instance.astronautSVG,
    ));
    onBoardItems.add(OnBoardModel(
      title: LocaleKeys.onBoard_page2_title,
      decription: LocaleKeys.onBoard_page2_desc.locale,
      imagePath: SVGImagePaths.instance.chattingSVG,
    ));
    onBoardItems.add(OnBoardModel(
      title: LocaleKeys.onBoard_page3_title,
      decription: LocaleKeys.onBoard_page3_desc.locale,
      imagePath: SVGImagePaths.instance.relaxingWalkSVG,
    ));
  }

  List<OnBoardModel> onBoardItems = [];

  @observable
  bool isLoding = false;

  @observable
  int currentIndex = 0;

  @action
  changeCurrentIndex(int index) {
    currentIndex = index;
  }

  @action
  void changeLoding() {
    isLoding = !isLoding;
  }

  Future<void> complateToOnBoard() async {
    changeLoding();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    // changeLoding();
    //navigation.navigateToPage(path: NavigationConstants.TEST_VIEW);
  }
}
