import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_seed/core/navigation.dart';
import 'package:flutter_redux_seed/models/app_state.dart';
import 'package:flutter_redux_seed/redux/init.dart';

final String appName = 'Flutter Demo';

class Init extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: initRedux(),
        child: MaterialApp(
          title: appName,
          navigatorKey: navigatorKey,
          theme: ThemeData.dark(),
          routes: routeScreens,
          initialRoute: initialRoute,
        ));
  }
}
