import 'package:flutter/material.dart';
import 'package:livi/components/page_error.dart';
import 'package:livi/home/start_page.dart';
import 'package:livi/user/user.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const StartPage(),
    '/user': (context) => const UserPage(),
  };

  static const String initialRoute = '/';

  // ignore: prefer_function_declarations_over_variables
  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (_) => const PageError(msg: '路由找不到'));
  };
}
