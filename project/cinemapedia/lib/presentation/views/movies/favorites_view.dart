import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLoading = false;
  bool isLastPage = false;
  @override
  void initState() {
    super.initState();
    // Load favorite movies when the view is initialized
    ref.read(favoriteMoviesProvider.notifier).loadFavoriteMovies();
  }


  void loadNextPage()async{
    if(isLoading || isLastPage) return;
    isLoading = true;
    final movie = await ref.read(favoriteMoviesProvider.notifier).loadFavoriteMovies();
    isLoading = false;
    if(movie.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();
    if (favoriteMovies.isEmpty) {
      return const Center(child: Text('No favorite movies found'));
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
}
