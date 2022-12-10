import 'package:flutter/widgets.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';
import '../../init/network/vexana_manager.dart';


abstract class BaseViewModel {
  ICoreDio? coreDio = NetworkManager.instance.coreDio;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;
 VexanaManager vexanaManager = VexanaManager.instance;

  late BuildContext contextMy;
  void setContext(BuildContext baseContext);
  void init();
}
