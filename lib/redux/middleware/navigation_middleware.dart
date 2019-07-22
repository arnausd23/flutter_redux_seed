import 'package:flutter_redux_seed/core/navigation.dart';
import 'package:flutter_redux_seed/models/app_state.dart';
import 'package:flutter_redux_seed/redux/actions/navigate_actions.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> navigationMiddleware([AppState state = const AppState(items: [])]) {
  final navigateTo = _navigateTo();
  final navigateReplace = _navivateReplace();

  return [
    TypedMiddleware<AppState, NavigateToAction>(navigateTo),
    TypedMiddleware<AppState, NavigateReplaceAction>(navigateReplace),
  ];
}

Middleware<AppState> _navigateTo() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    navigatorKey.currentState.pushNamed(action.route);
    next(action);
  };
}

Middleware<AppState> _navivateReplace() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    navigatorKey.currentState.pushNamed(Routes.example);
    next(action);
  };
}