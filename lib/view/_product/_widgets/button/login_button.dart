import 'package:flutter/material.dart';

import '../../../../core/components/button/icon_button.dart';

class MVVMLoginButton extends StatelessWidget {
  final Function(String data) onComplate;
  const MVVMLoginButton({super.key, required this.onComplate});

  @override
  Widget build(BuildContext context) {
    return IconNormalButton(
      onPressed: () {
        onComplate("okey");
      },
      icon: Icons.ac_unit_outlined,
    );
  }
}
