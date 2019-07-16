import 'package:flutter_redux_seed/models/item.dart';
import 'package:flutter_redux_seed/redux/actions/item_actions.dart';
import 'package:flutter_redux_seed/redux/reducers/item_reducer.dart';

import 'package:flutter_test/flutter_test.dart';

main() {
  group('Items Reducers', () {
    test('should add an item to the list in response to an AddItemAction', () {
      List<Item> initialItems = [];
      List<Item> newItems = addItemReducer(initialItems, AddItemAction('test'));
      expect(newItems.length, 1);
    });

    test('should remove an item from the list in response to an RemoveItemAction', () {
      Item item = Item(id: 0, body: 'hola');
      List<Item> initialItems = [item];
      List<Item> newItems = removeItemReducer(initialItems, RemoveItemAction(item));
      expect(newItems.length, 0);
    });

    test('should remove all items from the list in response to an RemoveItemsAction', () {
      Item item = Item(id: 0, body: 'hola');
      Item item2 = Item(id: 0, body: 'hola');
      List<Item> initialItems = [item, item2];
      List<Item> newItems = removeItemsReducer(initialItems, RemoveItemsAction());
      expect(newItems.length, 0);
    });
  });
}

