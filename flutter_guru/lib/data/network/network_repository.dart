import 'package:dio/dio.dart';
import 'package:flutter_guru/data/model/teacher/teacher.dart';
import 'package:flutter_guru/data/network/api_client.dart';
import 'package:flutter_guru/data/network/api_routes.dart';
import 'package:flutter_guru/data/response/response.dart' as baseResponse;

class NetworkRepository {
  Dio get _dio => ApiClient.dio();

  Future<baseResponse.Response<List<Teacher>>> getTeachers() async {
    Response res = await _dio.get(ApiRoutes.GET_TEACHERS);

    var response = baseResponse.Response<List<Teacher>>.fromJson(res.data,
        (json) => (json as List)?.map((e) => Teacher.fromJson(e))?.toList());

    return response;
  }

  Future<baseResponse.Response<void>> insertTeacher(
      String nip, String name, String email, String password) async {
    FormData body = FormData.fromMap(
        {'nip': nip, 'nama': name, 'email': email, 'password': password});

    Response res = await _dio.post(ApiRoutes.INSERT_TEACHER, data: body);

    var response =
        baseResponse.Response<void>.fromJson(res.data, (json) => null);

    return response;
  }

  void exampleDetail() {
    var result = {
      "status": "Success",
      "message": "Berhasil Memproses Data Guru",
      "data": {
        "nip": "098212",
        "nama": "Antonia",
        "email": "ichsan@gmail.com",
        "password":
            "42abd3846fe3fdc4755bc4683e051e09c1fc0f23c5c1ee067e863a8e0b3be8d2"
      }
    };

    var response = baseResponse.Response<Teacher>.fromJson(
        result, (json) => Teacher.fromJson(json));

    print(response.data.name);
  }
}
