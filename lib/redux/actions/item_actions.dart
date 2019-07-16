import 'package:flutter_redux_seed/domain/item.dart';

class AddItemAction {
  static int _id = 0;
  final String item;

  AddItemAction(this.item) {
    _id++;
  }

  int get id => _id;

  @override
  String toString() {
    return 'AddItemAction -> $item';
  }
}

class RemoveItemAction {
  final Item item;

  RemoveItemAction(this.item);

  @override
  String toString() {
    return 'RemoveItemAction -> $item';
  }
}

class RemoveItemsAction {
  @override
  String toString() {
    return 'RemoveItemsAction';
  }
}

class GetItemsAction {
  @override
  String toString() {
    return 'GetItemsAction';
  }
}

class LoadedItemsAction {
  final List<Item> items;

  LoadedItemsAction(this.items);

  @override
  String toString() {
    return 'LoadedItemsAction -> $items';
  }
}

class ItemCompletedAction {
  final Item item;

  ItemCompletedAction(this.item);

  @override
  String toString() {
    return 'ItemCompletedAction -> $item';
  }
}
