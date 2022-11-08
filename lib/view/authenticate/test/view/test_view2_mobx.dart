import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mvvm_template/core/components/text/locale_text.dart';
import 'package:flutter_mvvm_template/core/constants/enums/app_theme_enum.dart';
import 'package:flutter_mvvm_template/core/extension/string_extension.dart';
import 'package:flutter_mvvm_template/core/init/lang/language_manager.dart';
import 'package:flutter_mvvm_template/core/init/lang/locale_keys.g.dart';

import '../viewmodel/test_viewmodel.dart';

class TestView2 extends StatefulWidget {
  const TestView2({super.key});

  @override
  State<TestView2> createState() => _TestView2State();
}

class _TestView2State extends State<TestView2> {
  TestViewModel viewModel = TestViewModel();
  @override
  Widget build(BuildContext context) {
    return scaffolBuild;
  }

  Scaffold get scaffolBuild {
    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButtonNumberIncrement,
      body: textNumber,
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Observer(builder: (_) {
        return Text(viewModel.isEven.toString().locale);
      }),
      actions: [
        iconButtonChangeTheme(),
        IconButton(
            onPressed: () {
              viewModel.setContext(context);
              viewModel.changeTheme();
            },
            icon: const Icon(Icons.swipe_down_rounded))
      ],
    );
  }

  IconButton iconButtonChangeTheme() {
    return IconButton(
        onPressed: () {
          viewModel.changeLangugae(context);
        },
        icon: const Icon(Icons.change_history));
  }

  Widget get textNumber {
    return Center(
      child: Observer(builder: (_) {
        return Column(
          children: [
            Text(LocaleKeys.welcome.locale),
            Text(LocaleKeys.help.locale),
            LocaleText(value: LocaleKeys.good),
            LocaleText(value: LocaleKeys.bad),
            Text(viewModel.number.toString()),
          ],
        );
      }),
    );
  }

  FloatingActionButton get floatingActionButtonNumberIncrement =>
      FloatingActionButton(onPressed: () => viewModel.incrementNumber());
}
