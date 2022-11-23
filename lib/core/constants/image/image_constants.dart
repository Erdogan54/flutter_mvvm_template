class ImageConstants {
  ImageConstants._();
  static ImageConstants? _instance;
  static ImageConstants get instance {
    return _instance ??= ImageConstants._();
  }

  String get logo => toPng("veli");
  String get sosis => toPng("sosis");

  String toPng(String name) => "asset/image/$name.PNG";
}
