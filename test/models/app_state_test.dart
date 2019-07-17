import 'package:flutter_redux_seed/models/app_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AppState appState;
  Map sampleData;

  setUp(() {
    appState = AppState(items: []);
    sampleData = {'items': []};
  });

  tearDown(() {
    appState = null;
    sampleData = null;
  });

  group('AppState', () {
    test('Should return the appState items', () {
      expect(appState.items, []);
    });
    test('Should create from json', () {
      AppState newAppState = AppState.fromJson(sampleData);
      expect(newAppState.items, []);
    });
    test('Should map to json', () {
      AppState newAppState = AppState.fromJson(sampleData);
      expect(newAppState.toJson(), sampleData);
    });
    test('Should return initial state', () {
      AppState newAppState = AppState.initialState();
      expect(newAppState.items, []);
    });
  });
}
