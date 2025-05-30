import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (cootext, state) {
        final pageIndex = state.pathParameters['page'];
        final index = int.tryParse(pageIndex ?? '0') ?? 0;
        return HomeScreen(pageIndex: index);
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieID = state.pathParameters['id'];
            return MovieScreen(moviesId: movieID ?? 'no id');
          },
        ),
      ],
    ),

    GoRoute(
      path: '/',
      redirect: (_, _) {
        return '/home/0';
      },
    ),
  ],
);
