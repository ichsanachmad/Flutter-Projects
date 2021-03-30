import 'package:flutter_reactive/data/network/network_repository.dart';
import 'package:flutter_reactive/data/response/movie_list_response/movie_list_response.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  NetworkRepository _networkRepository = NetworkRepository();
  BehaviorSubject<MovieListResponse> _subject =
      BehaviorSubject<MovieListResponse>();

  getMovies() async {
    MovieListResponse response = await _networkRepository.getMovieList();
    print(response);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieListResponse> get subject => _subject;
}

final moviesBloc = MovieBloc();
