import 'package:flutter/cupertino.dart';
import 'package:news_app/layouts/nav_bar/nav_bar.dart';

class Routes {
  static const String NavBar = '/';
  Map<String, Widget Function(BuildContext)> appRoutes(context) {
    return {
      NavBar: (context) => NavBarScreen(),
    };
  }
}
