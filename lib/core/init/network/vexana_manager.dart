import 'package:vexana/vexana.dart';

class VexanaManager {
  VexanaManager._();
  static VexanaManager? _instance;
  static VexanaManager get instance {
    return _instance ??= VexanaManager._();
  }

  INetworkManager networkManager =
      NetworkManager(isEnableLogger: true, options: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
}
