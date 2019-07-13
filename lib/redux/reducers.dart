import 'package:flutter_redux_seed/model/model.dart';
import 'package:flutter_redux_seed/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(items: itemReducer(state.items, action));
}

List<Item> itemReducer(List<Item> state, action) {
  if (action is AddItemAction) {
    // To modify lists using immutability
    // you can pipe to an empty list this way
    return List.unmodifiable([]
      ..addAll(state)
      ..add(Item(id: action.id, body: action.item)));
  }

  if (action is RemoveItemAction) {
    // or this way
    return List.unmodifiable(List.from(state)..remove(action.item));
  }

  if (action is RemoveItemsAction) {
    return List.unmodifiable([]);
  }

  return state;
}
