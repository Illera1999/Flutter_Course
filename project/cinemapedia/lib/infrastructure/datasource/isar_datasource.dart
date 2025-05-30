import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDataSource {

  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if ( Isar.instanceNames.isEmpty ) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([ MovieSchema ], inspector: true,directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;
    final Movie? isMovieFavorite =
        await isar.movies.filter().idEqualTo(movieId).findFirst();
    return isMovieFavorite != null;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;
    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();
    if (favoriteMovie != null) {
      // If the movie is already a favorite, delete it
      // DELETE
      isar.writeTxnSync(() async {
        isar.movies.deleteSync(favoriteMovie.isarId!);
      });
    } else {
      // If the movie is not a favorite, add it
      // INSERT
      isar.writeTxnSync(() async {
        isar.movies.putSync(movie);
      });
    }
  }

  @override
  Future<List<Movie>> loadMovie({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.movies.where().offset(offset).limit(limit).findAll();
  }
}
