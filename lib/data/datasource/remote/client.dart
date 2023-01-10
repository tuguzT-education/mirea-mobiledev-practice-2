import 'package:dio/dio.dart' as dio;

class ApiClient {
  static const _baseUrl = "https://api.todoist.com/rest/v2/";
  static const _apiToken = "SECRET";

  final dioClient = dio.Dio(
    dio.BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $_apiToken",
      },
    ),
  );
}
