import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/constants/app/app_constants.dart';
import 'package:flutter_mvvm_template/core/extension/context_extension.dart';
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
      //colorSchemeSeed: Colors.green,
      //brightness: Brightness.light,
      //colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, primary: Colors.teal, secondary: Colors.green,),
      //useMaterial3: false,

      inputDecorationTheme: _inputDecorationTheme(),
      textTheme: _textTheme(),
      fontFamily: ApplicationConstants.FONT_FAMILY,
      floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
      tabBarTheme: _tabbarTheme(),
      scaffoldBackgroundColor: colorSchemeLight.alpineGoat,
      indicatorColor: _appColorScheme.primary);

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: _appColorScheme.primary)),
        // focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: _appColorScheme.primary)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: _appColorScheme.error)),
        focusColor: Colors.cyan);
  }

  TabBarTheme _tabbarTheme() => TabBarTheme(
        unselectedLabelStyle: textThemeLight.headline5,
        labelStyle: textThemeLight.headline6,
        labelPadding: paddingInsets.mediumPaddingAll,
        labelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
      );

  TextTheme _textTheme() {
    return TextTheme(
      headline1: textThemeLight.headline1,
      headline2: textThemeLight.headline2,
      // headline5: textThemeLight.headline5
    );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: colorSchemeLight.sunCreate, //xx
      onPrimary: Colors.black, //xx login button textcolor
      secondary: colorSchemeLight.abduction, // xx floating button background default bunu kullanıyor
      onSecondary: Colors.white, //xx icon button icon.color
      error: Colors.red,
      onError: Colors.pink,
      background: Colors.white,
      onBackground: Colors.black12,
      surface: Colors.blue,
      onSurface: Colors.white30,
      brightness: Brightness.light,
    );
  }
}
