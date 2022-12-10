import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mvvm_template/core/extension/context_extension_pro.dart';

class OnBoardCircle extends StatelessWidget {
  final bool isSelected;
  const OnBoardCircle({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
            backgroundColor: context.colors.error.withOpacity(isSelected ? 1 : 0.4),
            radius: isSelected ? context.width * 0.02 : context.width * 0.01),
    );
  }
}
