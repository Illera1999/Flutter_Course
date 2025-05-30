

import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDataSource _localStorageService;

  LocalStorageRepositoryImpl(this._localStorageService);

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return _localStorageService.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovie({int limit = 10, offset = 0}) {
    return _localStorageService.loadMovie(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return _localStorageService.toggleFavorite(movie);
  }

}