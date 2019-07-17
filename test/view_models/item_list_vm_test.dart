import 'package:flutter_redux_seed/redux/init.dart';
import 'package:flutter_redux_seed/view_models/item_list_vm.dart';
import 'package:flutter_redux_seed/models/app_state.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

main() {
  group('Item ViewModel', () {
    test('should add an item to the list in response to AddItem', () {
      final Store<AppState> store = initRedux();

      var viewModel = ItemListViewModel.create(store);
      expect(viewModel.items.length, 0);
      viewModel.onAddItem('test');
      expect(viewModel.items.length, 1);
    });
  });
}

