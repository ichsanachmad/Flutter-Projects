import 'package:dio/dio.dart';

class ApiClient {
  static Dio dio() {
    final options = BaseOptions(
        baseUrl: "https://api.themoviedb.org/3/",
        connectTimeout: 5000,
        receiveTimeout: 5000,
        sendTimeout: 10000,
        contentType: "application/json;charset=utf-8",
        queryParameters: {"api_key": "3930cf526980bf36a5abe4034f1cbdbd"});

    return Dio(options);
  }
}
