import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_template/core/init/network/ICoreDio.dart';
import 'package:flutter_mvvm_template/core/init/network/network_manager.dart';

abstract class BaseViewModel {
  late BuildContext contextMy;
  ICoreDio? coreDio = NetworkManager.instance.coreDio;
  void setContext(BuildContext baseContext);
  void init();
}
