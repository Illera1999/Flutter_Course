
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with AutomaticKeepAliveClientMixin<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNowPlaying();
    ref.read(popularMoviesProvider.notifier).loadNowPlaying();
    // ref.read(upcomingMoviesProvider.notifier).loadNowPlaying();
    ref.read(topRatedMoviesProvider.notifier).loadNowPlaying();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) {
      return const FullScreenLoader();
    }

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesAlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    // final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(title: CustomAppBar()),
          floating: true,
        ),
    
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlideshow(movies: slideShowMovies),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subTitle: 'Lunes 12',
                  loadNextPage: () {
                    ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNowPlaying();
                  },
                ),
                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  loadNextPage: () {
                    ref
                        .read(popularMoviesProvider.notifier)
                        .loadNowPlaying();
                  },
                ),
                // MovieHorizontalListview(
                //   movies: upcomingMovies,
                //   title: 'Proximamaente',
                //   subTitle: 'En este mes',
                //   loadNextPage: () {
                //     ref
                //         .read(upcomingMoviesProvider.notifier)
                //         .loadNowPlaying();
                //   },
                // ),
                MovieHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Mejor calificadas',
                  subTitle: 'Desde siemrpe',
                  loadNextPage: () {
                    ref
                        .read(topRatedMoviesProvider.notifier)
                        .loadNowPlaying();
                  },
                ),
    
    
                const SizedBox(height: 10),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}