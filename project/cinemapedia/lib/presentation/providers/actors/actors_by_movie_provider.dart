import 'dart:developer';

import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




final actorsByMovieProvider = StateNotifierProvider<ActorsMapNotifier,Map<String,List<Actor>>>((ref){
  final getActorsByMovie = ref.watch(actorsRepositoryProvider).getActorsByMovie;
  return ActorsMapNotifier(getActorsByMovie: getActorsByMovie);
}
);



typedef GetActorsCallBack = Future<List<Actor>> Function(String movieId);

class ActorsMapNotifier extends StateNotifier<Map<String, List<Actor>>> {

  final GetActorsCallBack getActorsByMovie;

  ActorsMapNotifier({
    required this.getActorsByMovie,
  }):super({});

  Future<void> loadActors(String movieId) async {
    if( state[movieId] != null) return;
    log('Loading actors for $movieId');
    final movie = await getActorsByMovie(movieId);
    state = {
      ...state,
      movieId: movie
    };
  }
}