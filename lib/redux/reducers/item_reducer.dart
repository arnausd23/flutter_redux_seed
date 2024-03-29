import 'package:flutter_redux_seed/models/item.dart';
import 'package:flutter_redux_seed/redux/actions/item_actions.dart';
import 'package:redux/redux.dart';

Reducer<List<Item>> itemReducer = combineReducers<List<Item>>([
  TypedReducer<List<Item>, AddItemAction>(addItemReducer),
  TypedReducer<List<Item>, RemoveItemAction>(removeItemReducer),
  TypedReducer<List<Item>, RemoveItemsAction>(removeItemsReducer),
  TypedReducer<List<Item>, LoadedItemsAction>(loadedItemsReducer),
  TypedReducer<List<Item>, ItemCompletedAction>(itemCompletedReducer),
]);

List<Item> addItemReducer(List<Item> items, AddItemAction action) {
  return List.unmodifiable([]
    ..addAll(items)
    ..add(Item(id: action.id, body: action.item)));
}

List<Item> removeItemReducer(List<Item> items, RemoveItemAction action) {
  return List.unmodifiable(List.from(items)..remove(action.item));
}

List<Item> removeItemsReducer(List<Item> items, RemoveItemsAction action) {
  return List.unmodifiable([]);
}

List<Item> loadedItemsReducer(List<Item> items, LoadedItemsAction action) {
  return action.items;
}

List<Item> itemCompletedReducer(List<Item> items, ItemCompletedAction action) {
  return items.map((item) => item.id == action.item.id ? item.copyWith(completed: !item.completed) : item).toList();
}
