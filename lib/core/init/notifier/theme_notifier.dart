import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../theme/app_theme_dark.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppThemeLight.instance.theme;
    } else {
      _currentTheme = AppThemeDark.instance.theme;
    }
    notifyListeners();
  }
}
