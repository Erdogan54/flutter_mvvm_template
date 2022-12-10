import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/app_theme_enum.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../../../../core/init/theme/app_theme_dark.dart';
import '../model/test_model.dart';

part 'test_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => contextMy = context;

  @override
  void init() {}

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
    if (Provider.of<ThemeNotifier>(contextMy, listen: false).currentTheme == AppThemeDark.instance.theme) {
      Provider.of<ThemeNotifier>(contextMy, listen: false).changeValue(AppThemes.LIGHT);
    } else {
      Provider.of<ThemeNotifier>(contextMy, listen: false).changeValue(AppThemes.DARK);
    }
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    final result =
        await coreDio?.myFetch<List<TestModel>, TestModel>("path", type: HttpTypes.GET, parseModel: TestModel());
    if (result is List<TestModel>) {}
    // await NetworkManager.instance.dioGet<TestModel>("x", TestModel());
    isLoading = false;
  }
}
