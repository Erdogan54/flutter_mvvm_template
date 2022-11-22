import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_template/core/init/navigation/navigation_service.dart';
import 'package:flutter_mvvm_template/core/init/network/ICoreDio.dart';
import 'package:flutter_mvvm_template/core/init/network/network_manager.dart';

import '../../init/cache/locale_manager.dart';

abstract class BaseViewModel {
  late BuildContext contextMy;
  ICoreDio? coreDio = NetworkManager.instance.coreDio;

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;
  

  void setContext(BuildContext baseContext);
  void init();
}
