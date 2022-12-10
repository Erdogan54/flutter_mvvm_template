
import 'package:flutter/widgets.dart';

class FormColumn extends StatelessWidget {
  final List<Widget> children;
  const FormColumn({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row (
      children: [
        const Spacer(flex: 1),
        Expanded(
          flex: 8,
          child: Column(
            children: children,
          ),
        ),
        const Spacer(flex: 1)
      ],
    );
  }
}
