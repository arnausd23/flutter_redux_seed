import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_seed/UI/pages.dart';
import 'package:flutter_redux_seed/model/model.dart';
import 'package:flutter_redux_seed/redux/actions.dart';
import 'package:flutter_redux_seed/redux/reducers.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(appStateReducer, initialState: AppState.initialState());
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: MyHomePage(),
        ));
  }
}


