import 'package:flutter_redux_seed/domain/app_state.dart';
import 'package:flutter_redux_seed/redux/reducers/item_reducer.dart';


AppState appStateReducer(AppState state, action) {
  return AppState(items: itemReducer(state.items, action));
}