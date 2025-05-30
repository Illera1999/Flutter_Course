import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottonNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomBottonNavigation({super.key, required this.currentIndex});


  void onItemTapped(int index, BuildContext context) {
    // Handle the navigation logic here
    switch (index) {
      case 0:
      context.go('/home/$index');
        break;
      case 1:
      context.go('/home/$index');
        break;
      case 2:
      context.go('/home/$index');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => onItemTapped(index, context),
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