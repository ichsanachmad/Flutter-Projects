import 'package:dio/dio.dart';
import 'package:flutter_reactive/data/network/api_client.dart';
import 'package:flutter_reactive/data/network/api_routes.dart';
import 'package:flutter_reactive/data/response/movie_list_response/movie_list_response.dart';

class NetworkRepository {
  Dio get _dio => ApiClient.dio();

  Future<MovieListResponse> getMovieList() async {
    Response res = await _dio.get(ApiRoutes.MOVIE_LIST);
    return MovieListResponse.fromJson(res.data);
  }
}
