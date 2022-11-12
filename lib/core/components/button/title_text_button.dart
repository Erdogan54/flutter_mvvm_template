import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_template/core/components/button/normal_button.dart';

class TitleTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const TitleTextButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(child: Text(text)),
    );
  }
}
