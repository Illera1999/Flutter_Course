import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigation(),
      );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    // final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMovies = ref.watch(moviesAlideshowProvider);

    // if (nowPlayingMovies.isEmpty) {
    //   return const Center(child: CircularProgressIndicator());
    // }
    return Column(
      children: [
        CustomAppBar(),
        MoviesSlideshow(movies: nowPlayingMovies),
      ],
    );
  }
}
