import 'package:flutter/material.dart';

class TextThemeLight {
  TextThemeLight._();
  static TextThemeLight? _instance;
  static TextThemeLight get instance {
    return _instance ??= TextThemeLight._();
  }

  final TextStyle headline1 = const TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );
  final TextStyle headline2 = const TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );

  final TextStyle headline3 = const TextStyle(fontSize: 48, fontWeight: FontWeight.w400);

  final TextStyle headline4 = const TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle headline5 = const TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  final TextStyle headline6 = const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.15);
  final TextStyle headline7 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.10);
}
