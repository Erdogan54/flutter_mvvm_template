import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm_template/core/init/navigation/navigation_service.dart';
import 'package:flutter_mvvm_template/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
