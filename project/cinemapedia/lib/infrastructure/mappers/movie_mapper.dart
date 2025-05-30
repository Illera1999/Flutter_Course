import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_details.dart';

class MovieMapper {
  static Movie toEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: moviedb.backdropPath != ''
        ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
        : 'https://i.imgur.com/BoUKmZQ.png',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: moviedb.posterPath != ''
        ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
        : 'https://static.posters.cz/image/1300/321.jpg',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage.toDouble(),
    voteCount: moviedb.voteCount,
  );

  static Movie  movieDetailsToEntity(MovieDetails moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: moviedb.backdropPath != ''
        ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
        : 'https://i.imgur.com/BoUKmZQ.png',
    genreIds: moviedb.genres.map((e) => e.name).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: moviedb.posterPath != ''
        ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
        : '/rZYYmjgyF5UP1AsvhzzDOFLCwG.jpg',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage.toDouble(),
    voteCount: moviedb.voteCount
  );
}
