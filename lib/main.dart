import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/constants/app/app_constants.dart';
import 'package:flutter_mvvm_template/core/init/lang/language_manager.dart';
import 'package:flutter_mvvm_template/core/init/notifier/provider_list.dart';
import 'package:flutter_mvvm_template/view/authenticate/test/view/test_view2_mobx.dart';
import 'package:provider/provider.dart';

import 'core/init/notifier/theme_notifier.dart';

//import '../locale_keys.g.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH,
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...ApplicationProvider.instance.dependItems,
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Material App',
        theme: Provider.of<ThemeNotifier>(context,listen: true).currentTheme,
        home: const TestView2(),
      ),
    );
  }
}
