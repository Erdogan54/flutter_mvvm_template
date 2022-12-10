import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';

import '../../extension/string_extension.dart';

class AutoLocaleText extends StatelessWidget {
  final String value;
  final TextAlign? textAlign;
  final TextStyle? style;
  const AutoLocaleText({super.key, required this.value,  this.textAlign,  this.style});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      value.locale,
      style: style,
      textAlign: textAlign,
    );
  }
}
