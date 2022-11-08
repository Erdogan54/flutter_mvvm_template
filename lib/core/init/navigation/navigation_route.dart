
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_template/core/components/card/not_found_navigation.dart';
import 'package:flutter_mvvm_template/core/constants/navigation/navigation_constants.dart';
import 'package:flutter_mvvm_template/view/authenticate/test/view/test_view2_mobx.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._();
  static NavigationRoute get instance => _instance;
  NavigationRoute._();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestView2());

      default:
        return MaterialPageRoute(builder: (context) => const NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
