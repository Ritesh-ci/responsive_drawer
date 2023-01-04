import 'package:flutter/material.dart';
import 'package:responsive_drawer/auth/login_view.dart';
import 'package:responsive_drawer/homePage/homePage_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/homeScreen':
        return MaterialPageRoute(
            builder: (_) => MyHomePage(
                  title: '',
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
