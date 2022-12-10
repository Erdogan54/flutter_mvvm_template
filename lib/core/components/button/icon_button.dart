import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'normal_button.dart';

class IconNormalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const IconNormalButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
