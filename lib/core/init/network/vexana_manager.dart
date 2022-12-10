import 'dart:io';

import 'package:vexana/vexana.dart';




class VexanaManager {
  VexanaManager._();
  static VexanaManager? _instance;
  static VexanaManager get instance {
    return _instance ??= VexanaManager._();
  }

  final String iosBaseUrl = "https://localhost:3000/";
  final String androidBaseUrl = "https://10.0.2.2:3000/";

  INetworkManager networkManager = NetworkManager(
      isEnableLogger: true,
      options: BaseOptions(baseUrl: Platform.isAndroid ? "https://10.0.2.2:3000/" : "https://localhost:3000/"));
}
