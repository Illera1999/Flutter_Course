import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {

  static const String name = '/movie-screen';

  final String moviesId;

  const MovieScreen({super.key, required this.moviesId});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState() {
    super.initState();

    ref.read(movieInfoProvider.notifier).loadMovie(widget.moviesId);

  }


  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.moviesId];
    if (movie == null) {
      return Scaffold(
        body: const Center(
          child: CircularProgressIndicator(strokeWidth: 2,),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie ID: ${widget.moviesId}'),
      ),
    );
  }
}