import 'package:flutter_redux_seed/model/item.dart';
import 'package:flutter_redux_seed/model/app_state.dart';
import 'package:flutter_redux_seed/redux/actions.dart';
import 'package:redux/redux.dart';

class ViewModel {
  final List<Item> items;
  final Function(Item) onCompleted;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  ViewModel({this.items, this.onCompleted, this.onAddItem, this.onRemoveItem, this.onRemoveItems});

  factory ViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(Item body) {
      store.dispatch(RemoveItemAction(body));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    _onCompleted(Item body) {
      store.dispatch(ItemCompletedAction(body));
    }

    return ViewModel(
        items: store.state.items,
        onAddItem: _onAddItem,
        onRemoveItem: _onRemoveItem,
        onRemoveItems: _onRemoveItems,
        onCompleted: _onCompleted);
  }
}
