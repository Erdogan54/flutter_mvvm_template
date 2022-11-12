import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/constants/app/app_constants.dart';
import 'package:flutter_mvvm_template/core/init/cache/locale_manager.dart';
import 'package:flutter_mvvm_template/core/init/lang/language_manager.dart';
import 'package:flutter_mvvm_template/core/init/navigation/navigation_route.dart';
import 'package:flutter_mvvm_template/core/init/notifier/provider_list.dart';
import 'package:flutter_mvvm_template/view/authenticate/login/view/login_view.dart';
import 'package:flutter_mvvm_template/view/authenticate/onboard/view/on_board_view.dart';
import 'package:flutter_mvvm_template/view/authenticate/test/view/test_view.dart';
import 'package:provider/provider.dart';

import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/theme_notifier.dart';

//import '../locale_keys.g.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await LocaleManager.preferencesInit();

  runApp(
    MultiProvider(
      providers: [
        ...ApplicationProvider.instance.dependItems,
      ],
      child: EasyLocalization(
          supportedLocales: LanguageManager.instance.supportedLocales,
          path: ApplicationConstants.LANG_ASSET_PATH,
          child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Material App',
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      home: const OnBoardView(),
    );
  }
}
