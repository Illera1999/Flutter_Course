import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> with AutomaticKeepAliveClientMixin<FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;
  @override
  void initState() {
    super.initState();
    // Load favorite movies when the view is initialized
    ref.read(favoriteMoviesProvider.notifier).loadFavoriteMovies();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movie =
        await ref.read(favoriteMoviesProvider.notifier).loadFavoriteMovies();
    isLoading = false;
    if (movie.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();
    if (favoriteMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
            Text(
              'Ohhhhh nooooo!',
              style: TextStyle(fontSize: 30, color: colors.primary),
            ),
            Text(
              'No tienes peliculas favoritas',
              style: TextStyle(fontSize: 15, color: colors.primary),
            ),
            SizedBox(height: 10),
            FilledButton.tonal(
              onPressed: () => context.go('/home/0'),
              child: Text('Empieza a buscar'),
            ),
          ],
        ),
      );
    }
    // Display the list of favorite movies
    return Scaffold(
      body: MovieMasonry(
        movies: favoriteMovies,
        onLoadNextPage: () {
          loadNextPage();
        },
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
