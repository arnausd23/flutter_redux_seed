import 'package:flutter_redux_seed/domain/app_state.dart';
import 'package:flutter_redux_seed/domain/item.dart';

List<Item> itemsSelector(AppState state) => state.items;