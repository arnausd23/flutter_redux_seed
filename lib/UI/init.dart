
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_seed/UI/screens/pages.dart';
import 'package:flutter_redux_seed/models/app_state.dart';
import 'package:flutter_redux_seed/redux/actions/item_actions.dart';
import 'package:flutter_redux_seed/redux/init.dart';
import 'package:redux/redux.dart';

class Init extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: initRedux(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(GetItemsAction()),
              builder: (BuildContext context, Store<AppState> store) => MyHomePage(store)),
        ));
  }
}