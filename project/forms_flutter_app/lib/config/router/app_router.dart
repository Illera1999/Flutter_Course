



import 'package:forms_flutter_app/presentation/screens.dart';
import 'package:go_router/go_router.dart';


final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/', // '/'
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cubits', // '/cubits'
      builder: (context, state) => const CubitCounterScreen(),
    ) 
  ]
);