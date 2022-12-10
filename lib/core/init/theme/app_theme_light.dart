import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

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
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
          systemOverlayStyle: SystemUiOverlayStyle.dark, iconTheme: const IconThemeData(color: Colors.black87, size: 25)),
      inputDecorationTheme: _inputDecorationTheme(),
      textTheme: _textTheme(),
      fontFamily: ApplicationConstants.FONT_FAMILY,
      floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
      tabBarTheme: _tabbarTheme,
      scaffoldBackgroundColor: colorSchemeLightCustom.alpineGoat,
      indicatorColor: _appColorScheme.primary);

  InputDecorationTheme _inputDecorationTheme() {
    //
    return InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: _appColorScheme.primary)),
        // focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: _appColorScheme.primary)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: _appColorScheme.error)),
        focusColor: Colors.cyan);
  }

  TabBarTheme get _tabbarTheme => TabBarTheme(
        // labelPadding: paddingInsets.mediumPaddingAll,
        labelColor: _appColorScheme.onPrimary,
        labelStyle: textThemeLightCustom.headline5,

        unselectedLabelStyle: textThemeLightCustom.headline6,
        unselectedLabelColor: _appColorScheme.onPrimary.withOpacity(0.2),
        indicatorSize: TabBarIndicatorSize.label,
      );

  TextTheme _textTheme() {
    return ThemeData.light().textTheme.copyWith(
          headline1: textThemeLightCustom.headline1,
          headline2: textThemeLightCustom.headline2,
          overline: textThemeLightCustom.headline3,
        );
    // return TextTheme(
    //   headline1: textThemeLight.headline1,
    //   headline2: textThemeLight.headline2,
    //   // headline5: textThemeLight.headline5
    // );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
      primary: colorSchemeLightCustom.sunCreate, //xx
      onPrimary: Colors.black, //xx login button textcolor
      secondary: colorSchemeLightCustom.abduction, // xx floating button background default bunu kullanıyor
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
