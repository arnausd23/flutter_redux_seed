import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_seed/UI/widgets.dart';
import 'package:flutter_redux_seed/model/model.dart';
import 'package:flutter_redux_seed/redux/actions.dart';
import 'package:redux/redux.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: StoreConnector<AppState, ViewModel>(
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (BuildContext context, ViewModel viewModel) => Column(
                children: <Widget>[
                  AddItemWidget(viewModel),
                  Expanded(child: ItemListWidget(viewModel)),
                  RemoveItemsButton(viewModel),
                ],
              )),
    );
  }
}

class ViewModel {
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  ViewModel({this.items, this.onAddItem, this.onRemoveItem, this.onRemoveItems});

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

    return ViewModel(
        items: store.state.items, onAddItem: _onAddItem, onRemoveItem: _onRemoveItem, onRemoveItems: _onRemoveItems);
  }
}
