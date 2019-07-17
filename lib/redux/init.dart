import 'package:flutter_redux_seed/models/app_state.dart';
import 'package:flutter_redux_seed/redux/middleware/persist_state_middleware.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_redux_seed/redux/reducers/index.dart';

DevToolsStore<AppState> initRedux() {
  return DevToolsStore<AppState>(appStateReducer,
      initialState: AppState.initialState(), middleware: persistStateMiddleware());
}
