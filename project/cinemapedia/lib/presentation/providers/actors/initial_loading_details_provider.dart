


import 'package:cinemapedia/presentation/providers/actors/actors_by_movie_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingDetailsProvider = Provider<bool>((ref) {
  final step1 = ref.watch(movieInfoProvider).isEmpty;
  final step2 = ref.watch(actorsByMovieProvider).isEmpty;

  if(step1 || step2) {
    return true;
  }
  return false;
});