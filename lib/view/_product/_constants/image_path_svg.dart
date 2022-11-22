import 'package:flutter_mvvm_template/core/extension/string_extension.dart';

class SVGImagePaths {
  SVGImagePaths._();
  static SVGImagePaths? _instance;
  static SVGImagePaths get instance {
    return _instance ??= SVGImagePaths._();
  }

  final relaxing_walkSVG = "relaxing_walk".toSVG;
  final astronautSVG = "astronaut".toSVG;
  final chattingSVG = "chatting".toSVG;
}


