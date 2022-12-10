import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/init/theme/app_theme_light.dart';

extension ContextExtensionPro on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowHeightValue => height * 0.001;
  double get normalHeightValue => height * 0.02;
  double get mediumHeightValue => height * 0.04;
  double get highHeightValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  // ColorScheme get colorScheme => theme.colorScheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowHeightValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalHeightValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumHeightValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highHeightValue);
}

extension PaddingExtensionSymetrich on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowHeightValue);
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalHeightValue);
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumHeightValue);
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highHeightValue);

  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowHeightValue);
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalHeightValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumHeightValue);
  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highHeightValue);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get durationLow => const Duration(seconds: 1);
  Duration get durationMedium => const Duration(milliseconds: 500);
  Duration get durationHigh => const Duration(milliseconds: 300);
}
