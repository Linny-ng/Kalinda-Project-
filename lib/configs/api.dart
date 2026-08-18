class ApiConfig {
  static const String baseUrl = "http://localhost/kalindayouth";

  static Uri endpoint(String path, {required http}) =>
      Uri.parse("$baseUrl/$path");
}
