import 'dart:convert';

import 'package:flutter_redux_seed/models/app_state.dart';
import 'package:flutter_redux_seed/infrastructure/interfaces/local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kItemsKey = 'itemsState';

class StateRepository implements LocalRepository {
  void save(AppState state) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var string = json.encode(state.toJson());
    await preferences.setString(kItemsKey, string);
  }

  Future<AppState> load() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var string = preferences.getString(kItemsKey);

    if (string != null) {
      Map map = json.decode(string);
      return AppState.fromJson(map);
    }
    return AppState.initialState();
  }
}
