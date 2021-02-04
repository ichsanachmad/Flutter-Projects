import 'package:dio/dio.dart';

class ApiClient {
  static Dio dio() {
    final options = BaseOptions(
        baseUrl: 'https://api.classico.id/ferinda/',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        contentType: "application/json;charset=utf-8");

    return Dio(options);
  }
}
