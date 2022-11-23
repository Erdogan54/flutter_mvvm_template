import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/base/model/base_view_model.dart';
import 'package:flutter_mvvm_template/core/init/network/vexana_manager.dart';
import 'package:flutter_mvvm_template/view/authenticate/login/service/ILoginService.dart';
import 'package:flutter_mvvm_template/view/authenticate/login/service/login_service.dart';
import 'package:mobx/mobx.dart';

import 'package:mobx/mobx.dart';

import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../model/login_model.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<ScaffoldMessengerState> scaffoldState = GlobalKey();
  GlobalKey<FormState> formState = GlobalKey();
  late ILoginService loginService;
  late TextEditingController emailController;
  late TextEditingController passwordContoroller;

  late BuildContext baseContext;
  void setContext(BuildContext context) => baseContext = context;
  void init() {
    loginService = LoginService(VexanaManager.instance.networkManager);
    emailController = TextEditingController();
    passwordContoroller = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  @action
  isLoadingStateChange() {
    isLoading = !isLoading;
  }

  @action
  fetchLoginService() async {
    isLoadingStateChange();
    if (formState.currentState?.validate() ?? false) {
      final response = await loginService
          .fetchUserControl(LoginModel(email: emailController.text, password: passwordContoroller.text));

      if (response != null) {
        scaffoldState.currentState?.showSnackBar(SnackBar(content: Text(response.token.toString())));
        localeManager.setStringValue(PreferencesKeys.TOKEN, response.token ?? "");
      }
    }
    isLoadingStateChange();
  }
}
