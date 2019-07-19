enum Environment { STAGING, QA, PROD }

class BuildConfig {
  static Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.STAGING:
        _config = _Config.stagingConstants;
        break;
      case Environment.QA:
        _config = _Config.qaConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get apiUrl => _config[_Config.API_URL];

  static get currentEnv => _config[_Config.CURRENT_ENV];
}

class _Config {
  static const API_URL = "API_URL";
  static const CURRENT_ENV = "CURRENT_ENV";

  static Map<String, dynamic> stagingConstants = {
    API_URL: "http://localhost:3000/api",
    CURRENT_ENV: Environment.QA,
  };

  static Map<String, dynamic> qaConstants = {
    API_URL: "http://localhost:3000/api",
    CURRENT_ENV: Environment.QA,
  };

  static Map<String, dynamic> prodConstants = {
    API_URL: "http://localhost:3000/api",
    CURRENT_ENV: Environment.PROD,
  };
}
