import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottonNavigation extends StatelessWidget {

  int getCurrentIndex(BuildContext context) {
    // Forma de resaltar donde estamos en el appbar
    final currentUri = GoRouter.of(context).routeInformationProvider.value.uri;
    switch (currentUri.path) {
      case '/':
        return 0; 
      case '/categories':
        return 1; 
      case '/favorites':
        return 2; 
      default:
        return 0; 
    }
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Navigate to Home
        context.go('/');
        break;
      case 1:
        // Navigate to Categories
        context.go('/categories');
        break;
      case 2:
        // Navigate to Favorites
        context.go('/favorites');
        break;
      default:
        break;
    }
  }
  const CustomBottonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: getCurrentIndex(context),
      onTap: (value) => _onItemTapped(context, value),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Categorías',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
    );
  }
}