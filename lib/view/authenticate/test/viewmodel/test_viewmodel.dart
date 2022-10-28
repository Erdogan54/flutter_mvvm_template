import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_template/core/constants/enums/app_theme_enum.dart';
import 'package:flutter_mvvm_template/core/init/notifier/theme_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/lang/language_manager.dart';
part 'test_viewmodel.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  late BuildContext myContext;

  setContext(BuildContext context) {
    myContext = context;
  }

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
  changeTheme(AppThemes theme) {
    Provider.of<ThemeNotifier>(myContext).changeValue(theme);
  }
}
