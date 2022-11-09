import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/init/theme/app_theme.dart';

class AppThemeDark extends AppTheme {
  AppThemeDark._();
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._();
  }

  // @override
  // ThemeData get theme => redTheme;

  @override
  ThemeData get theme => ThemeData.dark().copyWith(colorScheme: _appColorScheme());

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
