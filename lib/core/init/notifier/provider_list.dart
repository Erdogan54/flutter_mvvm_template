import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../navigation/navigation_service.dart';
import 'theme_notifier.dart';

class ApplicationProvider with ChangeNotifier {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._();
    return _instance!;
  }

  ApplicationProvider._();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    Provider.value(value: NavigationService.instance)
  ];
  List<SingleChildWidget> uiChangeItems = [];
}
