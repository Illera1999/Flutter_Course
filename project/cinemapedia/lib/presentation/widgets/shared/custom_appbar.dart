import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegate/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/search/search_movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 10),
              Text('CinePedia', style: titleStyle),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // Show search dialog
                  final searchQuery = ref.read(searchQueryProvifider);
                  final searchMovies = ref.read(searchMoviesProvider);


                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                      initMovies: searchMovies,
                      onSearch: (query){
                        return ref.read(searchMoviesProvider.notifier).searchMoviesByQuery(query);
                      }
                    ),
                  ).then((movie) {
                    if (movie == null) return;
                    if (context.mounted) {
                      context.push('/home/0/movie/${movie.id}');
                    }
                  });
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
