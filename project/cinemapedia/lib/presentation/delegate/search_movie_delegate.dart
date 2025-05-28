import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMovieCallback onSearch;
  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  List<Movie> initMovies;
  Timer? _debounceTimer;
  SearchMovieDelegate({required this.onSearch, required this.initMovies})
    : super(searchFieldLabel: 'Buscar Peliculas') {
    debounceMovies.add(initMovies);
    isLoadingStream.add(false);
  }

  void clearStream() {
    debounceMovies.close();
  }

  void _onQueryChanged(String query) {
    print('Query cambio');
    isLoadingStream.add(true);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      print('Buscando peliculas');
      if (debounceMovies.isClosed) return;
      final movies = await onSearch(query);
      debounceMovies.add(movies);
      initMovies = movies;
      isLoadingStream.add(false);
    });
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        stream: isLoadingStream.stream,
        builder: (context, snapshot) {
          final isLoading = snapshot.data ?? false;
          return IconButton(
            icon:
                isLoading
                    ? const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                      )
                    : const Icon(Icons.clear),
            onPressed: () {
              query = '';
              if (isLoading) return;
              clearStream();
              close(context, null);
            },
          );
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        clearStream();
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultAndSuggestion();
  }

  StreamBuilder<List<Movie>> buildResultAndSuggestion() {
    return StreamBuilder(
      initialData: initMovies,
      stream: debounceMovies.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieItem(
              movie: movie,
              onMovieSelected: (context, movie) {
                clearStream();
                close(context, movie);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return buildResultAndSuggestion();
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem({required this.movie, required this.onMovieSelected});

  final Movie movie;
  final Function onMovieSelected;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onMovieSelected(context, movie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    return FadeIn(
                      duration: const Duration(milliseconds: 200),
                      child: child,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyles.titleMedium),
                  (movie.overview.length > 100)
                      ? Text('${movie.overview.substring(0, 100)}...')
                      : Text(movie.overview),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[700]),
                      const SizedBox(width: 5),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1),
                        style: textStyles.bodyMedium!.copyWith(
                          color: Colors.yellow.shade900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
