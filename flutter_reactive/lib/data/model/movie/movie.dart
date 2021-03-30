import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  String title;

  @JsonKey(name: 'poster_path')
  String posterPath;

  @JsonKey(name: 'release_date')
  String releaseDate;

  @JsonKey(name: 'vote_average')
  double voteAverage;

  Movie({this.title, this.posterPath, this.releaseDate, this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
