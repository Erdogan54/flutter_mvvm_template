import '../../../core/extension/string_extension.dart';

class SVGImagePaths {
  SVGImagePaths._();
  static SVGImagePaths? _instance;
  static SVGImagePaths get instance {
    return _instance ??= SVGImagePaths._();
  }

  final relaxingWalkSVG = "relaxing_walk".toSVG;
  final astronautSVG = "astronaut".toSVG;
  final chattingSVG = "chatting".toSVG;
}
