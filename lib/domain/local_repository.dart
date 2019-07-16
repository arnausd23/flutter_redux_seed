import 'package:flutter_redux_seed/domain/app_state.dart';

abstract class LocalRepository {
  void save(AppState state);

  Future<AppState> load();
}