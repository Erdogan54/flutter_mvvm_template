import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mvvm_template/view/authenticate/login/view_model/login_view_model.dart';

import '../../../../core/base/view/base_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    late LoginViewModel viewModel;
    return BaseView<LoginViewModel>(
    viewmodel: LoginViewModel(),
    onModelReady: (model) {
    model.setContext(context);
    viewModel = model;
    },
    onPageBuilder: (BuildContext context,LoginViewModel viewModel) =>const Scaffold(),
    );
  }
}
