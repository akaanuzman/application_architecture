import 'package:flutter/material.dart';

import '../../../feature/test/view/test_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = NavigationRoute._init();
      return _instance!;
    }
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestView());

      default:
        return MaterialPageRoute(
            builder: (context) => NotFoundNavigationWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget home) =>
      MaterialPageRoute(builder: (context) => home);
}
