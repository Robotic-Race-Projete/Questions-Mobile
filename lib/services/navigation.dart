import 'package:flutter/cupertino.dart';

class NavigationServiceOld {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }

  void goBack() {
    navigatorKey.currentState?.pop();
  }
}