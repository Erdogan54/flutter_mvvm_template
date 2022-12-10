
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mvvm_template/core/components/text/locale_text.dart';

import 'package:flutter_mvvm_template/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_mvvm_template/core/extension/string_extension.dart';
import 'package:flutter_mvvm_template/core/init/cache/locale_manager.dart';

import 'package:flutter_mvvm_template/core/init/lang/locale_keys.g.dart';

import '../../../../core/extension/context_extension_pro.dart';
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
      body: textNumber(context),
    );
  }

  AppBar get appBar {
    return AppBar(
      leading: Text(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
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

  Widget textNumber(BuildContext context) {
    final List<Widget> widgetList = [
      Text(LocaleKeys.welcome.locale),
      Text(LocaleKeys.help.locale),
      LocaleText(value: LocaleKeys.good),
      LocaleText(value: LocaleKeys.bad),
      Text(viewModel.number.toString()),
    ];
    return Center(
      child: Observer(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...widgetList,
            mailField,
            Container(
              padding: context.paddingLow,
              height: context.height * 0.4,
              color: context.colors.onPrimary,
            ),
            Text("Hello",style: Theme.of(context).textTheme.headline1?.copyWith(color: Theme.of(context).primaryColor),)
          ],
        );
      }),
    );
  }

  FloatingActionButton get floatingActionButtonNumberIncrement =>
      FloatingActionButton(onPressed: () => viewModel.incrementNumber());
}

extension FieldMail on _TestView2State {
  TextFormField get mailField => TextFormField(
        validator: (value) => (value?.isValidEmail ?? false) ? null :"fasf kdgns",
      );
}
