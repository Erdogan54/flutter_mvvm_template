import 'package:flutter/widgets.dart';

abstract class BaseViewModel {
  late BuildContext baseContext;
  void setContext(BuildContext baseContext);
  void init();
}
