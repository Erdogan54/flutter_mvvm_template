import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowHeightValue => height * 0.01;
  double get normalHeightValue => height * 0.02;
  double get mediumHeightValue => height * 0.04;
  double get highHeightValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowHeightValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalHeightValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumHeightValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highHeightValue);

}
