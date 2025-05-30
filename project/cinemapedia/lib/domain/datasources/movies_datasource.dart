

import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {

  Future<List<Movie>> getNowPlayinng({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});

  Future<Movie> getMovieById(String id);

  Future<List<Movie>> searchMovie(String query, {int page = 1});
}