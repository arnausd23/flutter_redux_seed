import 'dart:convert';

import 'package:flutter_redux_seed/model/app_state.dart';
import 'package:flutter_redux_seed/redux/actions/item_actions.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kItemsKey = 'itemsState';

Middleware<AppState> _loadFromPrefs() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);
    var state = await loadFromPrefs();
    store.dispatch(LoadedItemsAction(state.items));
  };
}

Middleware<AppState> _saveToPrefs(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    saveToPrefs(store.state);
  };
}

void saveToPrefs(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = json.encode(state.toJson());
  await preferences.setString(kItemsKey, string);
}

Future<AppState> loadFromPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = preferences.getString(kItemsKey);

  if (string != null) {
    Map map = json.decode(string);
    return AppState.fromJson(map);
  }
  return AppState.initialState();
}

List<Middleware<AppState>> persistStateMiddleware([AppState state = const AppState(items: [])]) {
  final loadItems = _loadFromPrefs();
  final saveItems = _saveToPrefs(state);

  return [
    TypedMiddleware<AppState, AddItemAction>(saveItems),
    TypedMiddleware<AppState, RemoveItemAction>(saveItems),
    TypedMiddleware<AppState, RemoveItemsAction>(saveItems),
    TypedMiddleware<AppState, ItemCompletedAction>(saveItems),
    TypedMiddleware<AppState, GetItemsAction>(loadItems),
  ];
}
