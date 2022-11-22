import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/constants/app/app_constants.dart';
import 'package:flutter_mvvm_template/core/init/theme/app_theme.dart';
import 'package:flutter_mvvm_template/core/init/theme/light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._();
  }

  AppThemeLight._();

  // @override
  // ThemeData get theme => redTheme;

  @override
  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
        textTheme: _textTheme(),
        fontFamily: ApplicationConstants.FONT_FAMILY,
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
        tabBarTheme: _tabbarTheme(),
      );

  TabBarTheme _tabbarTheme() => TabBarTheme(
        unselectedLabelStyle: textThemeLight.headline2.copyWith(color: colorSchemeLight.azure),
        labelPadding: paddingInsets.mediumPaddingAll,
      );

  TextTheme _textTheme() {
    return TextTheme(
      headline1: textThemeLight.headline1,
      headline2: textThemeLight.headline2,
    );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: Colors.white, //xx
      onPrimary: Colors.greenAccent,
      secondary: colorSchemeLight.color1, // xx floating button background default bunu kullanıyor
      onSecondary: Colors.black, //xx
      error: Colors.orange,
      onError: Colors.red,
      background: Colors.white,
      onBackground: Colors.black12,
      surface: Colors.blue,
      onSurface: Colors.white30,
      brightness: Brightness.light,
    );
  }
}
