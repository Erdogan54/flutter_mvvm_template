class ImageConstants {
  ImageConstants._();
  static final ImageConstants _instance = ImageConstants._();
  static ImageConstants instance = _instance;

  String get logo => toPng("veli");
  String toPng(String name) => "asset/image/$name";
}
