import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/components/button/icon_button.dart';
import 'package:flutter_mvvm_template/view/authenticate/login/view_model/login_view_model.dart';
import 'package:flutter_mvvm_template/view/_product/_widgets/button/face_book_button.dart';
import 'package:flutter_mvvm_template/view/_product/_widgets/button/login_button.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    late LoginViewModel viewModel;
    return BaseView<LoginViewModel>(
      viewmodel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) => buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          MVVMLoginButton(
            onComplate: (data) {},
          ),
          FaceBookButton(
            onComplate: ({data, errorMessage}) {
              if (data != null) {
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage ?? "error null")));
              }
            },
          ),
        ],
      ),
    );
  }

  Text buildText() {
    return Text(
      "Hello",
      style: context.textTheme.headline1?.copyWith(
        color: context.theme.primaryColor,
        fontWeight: FontWeight.w100,
      ),
    );
  }
}
