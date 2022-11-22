import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mvvm_template/core/extension/string_extension.dart';

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
