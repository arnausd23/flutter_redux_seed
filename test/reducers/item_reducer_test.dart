import 'package:flutter_redux_seed/model/item.dart';
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
  });
}

