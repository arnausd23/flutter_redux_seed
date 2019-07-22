import 'package:flutter_redux_seed/models/item.dart';
import 'package:flutter_redux_seed/redux/init.dart';
import 'package:flutter_redux_seed/view_models/item_list_vm.dart';
import 'package:flutter_redux_seed/models/app_state.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

main() {
  Item item;
  Store<AppState> store;
  ItemListViewModel viewModel;

  setUp(() {
    store = initRedux();
    viewModel = ItemListViewModel.create(store);
    item = Item(id: 0, body: 'Some text');
  });

  tearDown(() {
    item = null;
    store = null;
    viewModel = null;
  });

  group('Item ViewModel', () {
    test('should add an item to the list in response to AddItem', () {
      expect(viewModel.items.length, 0);
      viewModel.onAddItem('test');
      expect(viewModel.items.length, 1);
    });
  });
}

