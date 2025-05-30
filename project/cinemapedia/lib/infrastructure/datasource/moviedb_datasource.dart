import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-ES',
      },
    ),
  );

  List<Movie> _jsonToMovie(Map<String, dynamic> json) {
    final MovieDbResponse movieDbResponse = MovieDbResponse.fromJson(json);
    return movieDbResponse.results
        .where((movie) => movie.posterPath != '/rZYYmjgyF5UP1AVsvhzzDOFLCG.jpg')
        .map((movie) => MovieMapper.toEntity(movie))
        .toList();
  }

  @override
  Future<List<Movie>> getNowPlayinng({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );

    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );

    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );

    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );

    return _jsonToMovie(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');

    if (response.statusCode != 200) {
      throw Exception('Error al obtener la película');
    }

    final movieDB = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDB);

    return movie;
  }
  
  @override
  Future<List<Movie>> searchMovie(String query, {int page = 1}) async{
    if (query.isEmpty) {
      return [];
    }
    final response = await dio.get(
      '/search/movie',
      queryParameters: {
        'query': query,
        'page': page
      },
    );

    return _jsonToMovie(response.data);
  }
}
