import 'package:flutter_redux_seed/UI/view_models/item_list_vm.dart';
import 'package:flutter_redux_seed/model/app_state.dart';
import 'package:flutter_redux_seed/redux/reducers/index.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

main() {
  group('Item ViewModel', () {
    test('should add an item to the list in response to AddItem', () {
      final Store<AppState> store = Store<AppState>(appStateReducer,
          initialState: AppState.initialState(), middleware: []);

      var viewModel = ItemListViewModel.create(store);
      expect(viewModel.items.length, 0);
      viewModel.onAddItem('asdasdwa');
      expect(viewModel.items.length, 1);
    });
  });
}

