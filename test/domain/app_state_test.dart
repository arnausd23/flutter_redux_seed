import 'package:flutter_redux_seed/domain/app_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AppState appState;

  setUp(() {
    appState = AppState(items: []);
  });

  tearDown(() {
    appState = null;
  });

  group('AppState', () {
    test('Should return the appState items', () {
      expect(appState.items, []);
    });
    test('Should create from json', () {
      AppState newAppState = AppState.fromJson({'items': []});
      expect(newAppState.items, []);
    });
    test('Should map to json', () {
      AppState newAppState = AppState.fromJson({'items': []});
      expect(newAppState.toJson(), {'items': []});
    });
    test('Should return initial state', () {
      AppState newAppState = AppState.initialState();
      expect(newAppState.items, []);
    });
  });
}
