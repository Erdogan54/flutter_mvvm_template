import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/extension/context_extension_pro.dart';

class NormalButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const NormalButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: context.paddingLow,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Center(child: child),
        ),
      ),
    );

    //gumushoe
    //two
  }
}
