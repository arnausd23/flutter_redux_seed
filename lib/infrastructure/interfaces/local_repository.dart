import 'package:flutter_redux_seed/models/app_state.dart';

abstract class LocalRepository {
  void save(AppState state);

  Future<AppState> load();
}