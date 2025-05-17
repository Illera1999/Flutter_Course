import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-ES',
      },
    ),
  );

  List<Actor> _jsonToActor(Map<String, dynamic> json) {
    final CreditsResponse creditsResponse = CreditsResponse.fromJson(json);
    return creditsResponse.cast
        .where((actor) => actor.profilePath != 'no-poster')
        .map((actor) => ActorMapper.castToEntity(actor))
        .toList();
  }

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    if (response.statusCode != 200) {
      throw Exception('Error al obtener los actores');
    }
    return _jsonToActor(response.data);
  }
}
