import 'color_scheme_light.dart';
import 'padding_insets.dart';
import 'text_theme_light.dart';

abstract class ILightTheme {
  TextThemeLight textThemeLightCustom = TextThemeLight.instance;
  ColorSchemeLight colorSchemeLightCustom = ColorSchemeLight.instance;
  PaddingInsets paddingInsets = PaddingInsets();
}
