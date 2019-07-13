import 'dart:convert';

import 'package:flutter_redux_seed/model/model.dart';
import 'package:flutter_redux_seed/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kItemsKey = 'itemsState';

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

void appStateMiddleware(Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  if (action is AddItemAction || action is RemoveItemAction || action is RemoveItemsAction) {
    saveToPrefs(store.state);
  }

  if (action is GetItemsAction) {
    await loadFromPrefs().then((state) => store.dispatch(LoadedItemsAction(state.items)));
  }
}
