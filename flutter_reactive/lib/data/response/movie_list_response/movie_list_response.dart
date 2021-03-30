import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_reactive/data/model/movie/movie.dart';

part 'movie_list_response.g.dart';

@JsonSerializable()
class MovieListResponse {
  @JsonKey(name: 'created_by')
  String createdBy;
  String description;
  @JsonKey(name: 'items')
  List<Movie> movies;

  MovieListResponse({this.createdBy, this.description, this.movies});

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
