import 'package:flutter_redux_seed/config.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Config', () {
    test('should have production environment variables', () {
      BuildConfig.setEnvironment(Environment.PROD);
      expect(BuildConfig.currentEnv, Environment.PROD);
    });
    test('should have qa environment variables', () {
      BuildConfig.setEnvironment(Environment.QA);
      expect(BuildConfig.currentEnv, Environment.QA);
    });
    test('should have staging environment variables', () {
      BuildConfig.setEnvironment(Environment.STAGING);
      expect(BuildConfig.currentEnv, Environment.STAGING);
    });
  });
}

