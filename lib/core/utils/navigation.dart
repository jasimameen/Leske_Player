import 'package:flutter/material.dart';

class Navigation {
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
      
  // initialize navigation state
  static GlobalKey<NavigatorState> initState() => _navigatorKey;

  /// Push the given route onto the navigator.
  ///
  /// {@macro flutter.widgets.navigator.push}
  ///
  /// {@macro flutter.widgets.navigator.pushNamed.returnValue}
  ///
  static Future<T?> push<T extends Object?>(
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
  /// Push a named route onto the navigator.
  ///
  /// The route name will be passed to the [Navigator.onGenerateRoute] callback. The returned route will be pushed into the navigator.
  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  /// Pop the top-most route off the navigator.
  static void pop<T extends Object?>([T? result]) {
    return _navigatorKey.currentState!.pop(result);
  }
}
