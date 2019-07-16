import 'package:flutter_redux_seed/models/app_state.dart';
import 'package:flutter_redux_seed/models/item.dart';

List<Item> itemsSelector(AppState state) => state.items;