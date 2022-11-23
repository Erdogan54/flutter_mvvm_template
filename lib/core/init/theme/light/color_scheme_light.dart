import 'package:flutter/material.dart';

class ColorSchemeLight {
  ColorSchemeLight._();
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance {
    return _instance ??= ColorSchemeLight._();
  }

  final Color brown = const Color(0xffa87e6f);
  final Color red = const Color(0xffc10e0e);
  final Color white = const Color(0xffffffff);
  final Color gray = const Color(0xffa5a6ae);
  final Color lightGray = const Color(0xfff7f7f7);
  final Color darkGray = const Color(0xff676870);
  final Color black = const Color(0xff020306);
  final Color azure = const Color(0xff27928d);

  final Color abduction = const Color(0xff1c6460);
  final Color sunCreate = const Color(0xffff8c02);
  final Color alpineGoat = const Color(0xfff0f0f8);
}
