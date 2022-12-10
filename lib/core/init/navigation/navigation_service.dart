import 'package:flutter/widgets.dart';

import 'INavigationService.dart';

class NavigationService extends INavigationService {
  static final NavigationService _instance = NavigationService._();
  static NavigationService get instance => _instance;
  NavigationService._();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  removeAllOldRoutes({Route<dynamic>? route}) => false;

  @override
  Future<void> navigateToPage({required String path, Object? object}) async {
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!.pushNamed(path, arguments: object);
    }
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? object}) async {
    if (navigatorKey.currentState != null) {
      await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, removeAllOldRoutes(), arguments: object);
    }
  }
}
