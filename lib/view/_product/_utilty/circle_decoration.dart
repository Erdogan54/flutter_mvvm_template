// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:flutter_mvvm_template/core/components/decoration/circle_decoration.dart';
import 'package:flutter_mvvm_template/core/extension/context_extension_pro.dart';

class DecorationHelper {
  BuildContext context;
  DecorationHelper({
    required this.context,
  });

  Decoration get circleDecoration => CircleDecoration(color: context.colors.primary, radius: 3);
}
