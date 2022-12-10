import 'package:flutter_mvvm_template/core/init/theme/light/color_scheme_light.dart';
import 'package:flutter_mvvm_template/core/init/theme/light/padding_insets.dart';
import 'package:flutter_mvvm_template/core/init/theme/light/text_theme_light.dart';

abstract class ILightTheme {
  TextThemeLight textThemeLightCustom = TextThemeLight.instance;
  ColorSchemeLight colorSchemeLightCustom = ColorSchemeLight.instance;
  PaddingInsets paddingInsets = PaddingInsets();
}
