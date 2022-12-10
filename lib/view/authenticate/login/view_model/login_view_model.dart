// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../model/login_model.dart';
import '../service/ILoginService.dart';
import '../service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<ScaffoldMessengerState> scaffoldState = GlobalKey();
  GlobalKey<FormState> formState = GlobalKey();
  late ILoginService loginService;
  late TextEditingController emailController;
  late TextEditingController passwordContoroller;

  late BuildContext baseContext;
  @override
  void setContext(BuildContext context) => baseContext = context;
  @override
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
