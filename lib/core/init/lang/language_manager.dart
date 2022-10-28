import 'dart:ui';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._();
    return _instance!;
  }

  LanguageManager._();

  final enLocale = const Locale("en", "US");
  final trLocale = const Locale("tr", "TR");

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
