import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_repository_provider.dart';



final movieInfoProvider = StateNotifierProvider<MovieMapNotifier,Map<String,Movie>>((ref){
  final getMovies = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getMovie: getMovies);
}
);



typedef GetMovieCallBack = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

  final GetMovieCallBack getMovie;

  MovieMapNotifier({
    required this.getMovie,
  }):super({});

  Future<void> loadMovie(String movieId) async {
    if( state[movieId] != null) return;
    print('Loading movie $movieId');
    final movie = await getMovie(movieId);
    state = {
      ...state,
      movieId: movie
    };
  }
}