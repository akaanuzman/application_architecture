import 'package:flutter/material.dart';

import 'INavigationService.dart';

class NavigationService implements INavigationService {
  static NavigationService? _instance;
  static NavigationService get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = NavigationService._init();
      return _instance!;
    }
  }

  NavigationService._init();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<void> navigateToPage(
      {required String path, required Object object}) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: object);
  }

  @override
  Future<void> navigateToPageClear(
      {required String path, required Object object}) async {
    await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: object);
  }
}
