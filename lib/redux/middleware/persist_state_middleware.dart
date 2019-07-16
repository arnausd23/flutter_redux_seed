import 'package:flutter_redux_seed/model/app_state.dart';
import 'package:flutter_redux_seed/redux/actions/item_actions.dart';
import 'package:flutter_redux_seed/redux/middleware/state_repository.dart';
import 'package:redux/redux.dart';

var stateRepo = StateRepository();

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

Middleware<AppState> _loadFromPrefs() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);
    var state = await stateRepo.load();
    store.dispatch(LoadedItemsAction(state.items));
  };
}

Middleware<AppState> _saveToPrefs(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    stateRepo.save(store.state);
  };
}
