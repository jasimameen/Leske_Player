import 'package:flutter/material.dart';


class Navigation {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get initState => _navigatorKey;

  static Navigation get instance => Navigation();

  Future<T?> push<T extends Object?>(
    Widget widget, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    return _navigatorKey.currentState!.push(MaterialPageRoute(
      builder: (context) => widget,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    ));
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void pop<T extends Object?>([T? result]) {
    return _navigatorKey.currentState!.pop(result);
  }
}
