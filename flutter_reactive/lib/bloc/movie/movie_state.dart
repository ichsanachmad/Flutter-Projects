import 'package:equatable/equatable.dart';
import 'package:flutter_reactive/data/model/movie/movie.dart';

class MovieState extends Equatable {
  @override
  List<Object> get props => [];
}

class SuccessLoadMovieList extends MovieState {
  final List<Movie> movies;

  SuccessLoadMovieList({this.movies});

  @override
  List<Object> get props => [this.movies];
}

class FailedLoadMovieList extends MovieState {
  @override
  List<Object> get props => [];
}
