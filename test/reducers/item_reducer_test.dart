import 'package:flutter_redux_seed/models/item.dart';
import 'package:flutter_redux_seed/redux/actions/item_actions.dart';
import 'package:flutter_redux_seed/redux/reducers/item_reducer.dart';

import 'package:flutter_test/flutter_test.dart';

main() {
  group('Item Reducers', () {
    Item item;
    Item item2;
    List<Item> initialItems;
    List<Item> someItems;

    setUp(() {
      item = Item(id: 0, body: 'Some text');
      item2 = Item(id: 1, body: 'hola');
      initialItems = [item];
      someItems = [item, item2];
    });

    tearDown(() {
      item = null;
    });

    test('should add an item to the list in response to an AddItemAction', () {
      List<Item> newItems = addItemReducer(initialItems, AddItemAction('test'));
      expect(newItems.length, 2);
    });

    test('should remove an item from the list in response to a RemoveItemAction', () {
      List<Item> newItems = removeItemReducer(initialItems, RemoveItemAction(item));
      expect(newItems.length, 0);
    });

    test('should remove all items from the list in response to a RemoveItemsAction', () {
      List<Item> newItems = removeItemsReducer(someItems, RemoveItemsAction());
      expect(newItems.length, 0);
    });

    test('should get all items in response to a LoadedItemsAction', () {
      List<Item> allItems = loadedItemsReducer(initialItems, LoadedItemsAction(someItems));
      expect(allItems.length, 2);
    });

    test('should complete a item in response to an ItemCompletedAction', () {
      List<Item> allItems = itemCompletedReducer(someItems, ItemCompletedAction(item));
      expect(allItems.first.completed, true);
    });
  });
}
