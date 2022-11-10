import 'package:flutter/material.dart';

class TextThemeLight {
  TextThemeLight._();
  static TextThemeLight? _instance;
  static TextThemeLight get instance {
    return _instance ??= TextThemeLight._();
  }

  final TextStyle headline1 = const TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline2 = const TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5);
}
