// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    title: json['title'] as String,
    posterPath: json['poster_path'] as String,
    releaseDate: json['release_date'] as String,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
    };
