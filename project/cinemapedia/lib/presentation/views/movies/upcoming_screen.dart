

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpcomingScreen extends ConsumerStatefulWidget {
  const UpcomingScreen({super.key});

  @override
  ConsumerState<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends ConsumerState<UpcomingScreen> with AutomaticKeepAliveClientMixin<UpcomingScreen> {
  bool isLoading = false; // Si estácargando
  bool isLastPage = false; // Si ya es la última pestaña

  @override
  void initState() {
    super.initState();
    ref.read(upcomingMoviesProvider.notifier).loadNowPlaying(); 
  }

  void loadNextPage() async {
    if(isLoading || isLastPage) return;
    isLoading = true;
    final newUpcomingMovies = await ref.read(upcomingMoviesProvider.notifier).loadNowPlaying(); 
    isLoading = true;
    if(newUpcomingMovies.isEmpty) {
      isLastPage = true;
    }
  }



  @override
  Widget build(BuildContext context) {
    super.build(context);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    return MovieMasonry(
      movies: upcomingMovies,
      onLoadNextPage: () => loadNextPage(),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}