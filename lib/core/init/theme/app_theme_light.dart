import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/init/theme/app_theme.dart';
import 'package:flutter_mvvm_template/core/init/theme/panachi/red_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._();
  }

  AppThemeLight._();

  // @override
  // ThemeData get theme => redTheme;

  @override
  ThemeData get theme => ThemeData.light().copyWith(colorScheme: _appColorScheme());

  ColorScheme _appColorScheme() {
    return const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.red,
        onPrimary: Colors.redAccent,
        secondary: Colors.green,
        onSecondary: Colors.greenAccent,
        error: Colors.red,
        onError: Colors.redAccent,
        background: Colors.orange,
        onBackground: Colors.orangeAccent,
        surface: Colors.teal,
        onSurface: Colors.tealAccent);
  }
}
