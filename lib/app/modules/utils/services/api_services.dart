class ApiService {
  ApiService._();

  static const String baseDEVURL = '';
  static const String baseQAURL = 'https://restcountries.com/v3.1/all';
  static const String baseUATURL = '';

  static Future<String> init(String env) async {
    switch (env) {
      case 'dev':
        return baseDEVURL;
      case 'qa':
        return baseQAURL;
      case 'uat':
        return baseUATURL;
      default:
        return baseDEVURL;
    }
  }
  static const String loginEndpoint = 'employee-login';
}
