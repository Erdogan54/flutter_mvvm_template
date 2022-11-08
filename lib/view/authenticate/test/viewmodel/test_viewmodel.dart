import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/constants/enums/app_theme_enum.dart';
import 'package:flutter_mvvm_template/core/init/notifier/theme_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/test_model.dart';
part 'test_viewmodel.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  late BuildContext myContext;

  setContext(BuildContext context) {
    myContext = context;
  }

  @observable
  bool isLoading = false;

  @observable
  int number = 1;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  incrementNumber() {
    number++;
  }

  @action
  changeLangugae(BuildContext context) {
    if (context.locale == LanguageManager.instance.enLocale) {
      context.setLocale(LanguageManager.instance.trLocale);
    } else {
      context.setLocale(LanguageManager.instance.enLocale);
    }
  }

  @action
  changeTheme() {
    if (Provider.of<ThemeNotifier>(myContext, listen: false).currentTheme == ThemeData.dark()) {
      Provider.of<ThemeNotifier>(myContext, listen: false).changeValue(AppThemes.LIGHT);
    } else {
      Provider.of<ThemeNotifier>(myContext, listen: false).changeValue(AppThemes.DARK);
    }
  }

  @action
 Future<void> getSampleRequest() async {
    isLoading = true;
    await NetworkManager.instance.dioGet<TestModel>("x", TestModel());
    isLoading = false;
  }
}
