import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/init/theme/app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._();
    return _instance!;
  }

  AppThemeLight._();

  @override
  ThemeData get theme => ThemeData.light();
}
