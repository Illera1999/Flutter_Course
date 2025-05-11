import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart';

final moviesAlideshowProvider = Provider<List<Movie>>((ref) {
  final movies = ref.watch(nowPlayingMoviesProvider);

  if(movies.isEmpty) return [];

  return movies.sublist(0, 6);
});


