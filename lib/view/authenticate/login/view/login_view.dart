import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mvvm_template/core/constants/image/image_constants.dart';
import 'package:flutter_mvvm_template/core/init/lang/locale_keys.g.dart';

import 'package:flutter_mvvm_template/view/authenticate/login/view_model/login_view_model.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewmodel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) => DefaultTabController(
        length: 2,
        child: Scaffold(
          key: viewModel.scaffoldState,
          body: SafeArea(
            child: Column(children: [
              animatedContainer(context),
              buildContainerTabbar(),
              Expanded(flex: 6, child: Padding(padding: context.paddingNormal, child: buildForm(viewModel, context))),
            ]),
          ),
        ),
      ),
    );
  }

  AnimatedContainer animatedContainer(BuildContext context) {
    return AnimatedContainer(
      height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
      color: Colors.white,
      duration: context.durationMedium,
      child: Center(
          child: Image.asset(
        ImageConstants.instance.sosis,
      )),
    );
  }

  Container buildContainerTabbar() {
    return Container(
      decoration:
          const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
      child: buildTabbar(),
    );
  }

  TabBar buildTabbar() {
    return  TabBar(
      // labelColor: Colors.black,
      // indicatorSize: TabBarIndicatorSize.label,
      //indicatorColor: context.colors.primary,
      // unselectedLabelStyle: context.textTheme.headline5,
      // labelStyle: context.textTheme.headline5,
      tabs: [
        Tab(text: LocaleKeys.login_tab1.tr()),
        Tab(text: LocaleKeys.login_tab2.tr()),
      ],
    );
  }

  Form buildForm(LoginViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Spacer(flex: 6),
          buildTextFormFieldEmail(context, viewModel),
          Spacer(),
          buildTextFromFieldPassword(context, viewModel),
          Spacer(),
          buildTextForgot(),
          Spacer(flex: 6),
          buildLoginButton(context, viewModel),
          buildWrapAccount(),
          Spacer(flex: 1),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      //validator: (value) => (value?.isValidEmail ?? false) ? null : "kkl lknj afsf",
      validator: (value) => (value?.isValidEmailWithPackage ?? false) ? null : "gecerli bir email giriniz",
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.tr(),
        icon: buildContainerIconField(context, Icons.email, context.colors.primary),
      ),
    );
  }

  Widget buildTextFromFieldPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordContoroller,
        validator: (value) => (value?.isNotEmpty ?? false) ? null : "This field required",
        keyboardType: TextInputType.number,
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
            labelText: LocaleKeys.login_password.tr(),
            icon: buildContainerIconField(context, Icons.vpn_key, context.colors.primary),
            suffixIcon: InkWell(
                onTap: () => viewModel.isLockStateChange(),
                child: Observer(builder: (_) {
                  return Icon(viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
                }))),
      );
    });
  }

  Widget buildContainerIconField(BuildContext context, IconData icon, Color backgroundColor) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(7)),
      // padding: EdgeInsets.all(2),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        color: context.colors.onSecondary,
      ),
    );
  }

  Widget buildTextForgot() =>  Align(
        alignment: Alignment.centerRight,
        child: Text(LocaleKeys.login_forgotText.tr()),
      );

  Widget buildLoginButton(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const StadiumBorder()),
          padding: MaterialStateProperty.all(context.paddingNormal),
          // backgroundColor: MaterialStateProperty.all(context.colors.primary),
        ),
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginService();
              },
        child: Center(
          child: Text(LocaleKeys.login_login.tr(), style: context.textTheme.headline5),
        ),
      );
    });
  }

  Wrap buildWrapAccount() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
         Text(LocaleKeys.login_dontAccount.tr()),
        TextButton(
          onPressed: () {},
          child:  Text(LocaleKeys.login_tab2.tr(), style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
