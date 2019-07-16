import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_seed/UI/screens/pages.dart';
import 'package:flutter_redux_seed/models/app_state.dart';
import 'package:flutter_redux_seed/redux/actions/item_actions.dart';
import 'package:flutter_redux_seed/redux/middleware/persist_state_middleware.dart';
import 'package:flutter_redux_seed/redux/reducers/index.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DevToolsStore<AppState> store = DevToolsStore<AppState>(appStateReducer,
        initialState: AppState.initialState(), middleware: persistStateMiddleware());

    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(GetItemsAction()),
              builder: (BuildContext context, Store<AppState> store) => MyHomePage(store)),
        ));
  }
}
