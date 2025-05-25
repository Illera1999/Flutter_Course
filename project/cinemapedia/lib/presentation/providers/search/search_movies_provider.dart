import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';
import '../movies/movies_repository_provider.dart';

final searchQueryProvifider = StateProvider<String>((ref) {
  return '';
});

final searchMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifier, List<Movie>>((ref) {
      final searchMovieFuntion = ref.read(movieRepositoryProvider).searchMovie;
      return SearchMoviesNotifier(
        searchMovieCallback: searchMovieFuntion,
        ref: ref
      );
    });

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMovieCallback searchMovieCallback;
  final Ref ref;
  SearchMoviesNotifier({
    required this.searchMovieCallback,
    required this.ref,
  }) : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovieCallback(query);
    ref.read(searchQueryProvifider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
