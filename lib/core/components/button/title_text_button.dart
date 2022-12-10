
import 'package:flutter/widgets.dart';

import 'normal_button.dart';

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
