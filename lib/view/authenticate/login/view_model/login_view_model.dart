import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

// ignore: library_private_types_in_public_api
class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => contextMy = context;

  @override
  void init() {}
}
