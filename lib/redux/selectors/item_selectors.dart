import 'package:flutter_redux_seed/model/app_state.dart';
import 'package:flutter_redux_seed/model/item.dart';

List<Item> itemsSelector(AppState state) => state.items;