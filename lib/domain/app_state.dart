import 'package:flutter/foundation.dart';
import 'package:flutter_redux_seed/domain/item.dart';

class AppState {
  final List<Item> items;

  const AppState({@required this.items});

  AppState.initialState() : items = List.unmodifiable(<Item>[]);

  AppState.fromJson(Map json) : items = (json['items'] as List).map((i) => Item.fromJson(i)).toList();

  Map toJson() => {'items': items};

  @override
  String toString() {
    return toJson().toString();
  }
}
