import 'package:flutter/material.dart';
import 'package:flutter_redux_seed/UI/screens/pages.dart';

final navigatorKey = new GlobalKey<NavigatorState>();

final initialRoute = Routes.home;

class Routes {
  static final home = "homeScreen";
  static final example = "exampleScreen";
}

final routeScreens = {
  Routes.home: (context) => MyHomePage(),
  Routes.example: (context) => MyTestPage(),
};
