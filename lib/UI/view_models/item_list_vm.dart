import 'package:flutter_redux_seed/model/item.dart';
import 'package:flutter_redux_seed/model/app_state.dart';
import 'package:flutter_redux_seed/redux/actions/item_actions.dart';
import 'package:redux/redux.dart';

class ItemListViewModel {
  final List<Item> items;
  final Function(Item) onCompleted;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  ItemListViewModel({this.items, this.onCompleted, this.onAddItem, this.onRemoveItem, this.onRemoveItems});

  factory ItemListViewModel.create(Store<AppState> store) {
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

    return ItemListViewModel(
        items: store.state.items,
        onAddItem: _onAddItem,
        onRemoveItem: _onRemoveItem,
        onRemoveItems: _onRemoveItems,
        onCompleted: _onCompleted);
  }
}
