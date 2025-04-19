


import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

  const appMenuItems = <MenuItems>[
    MenuItems(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined,
    ),
    MenuItems(
      title: 'Tarjetas',
      subTitle: 'Uncontador estilizado',
      link: '/cards',
      icon: Icons.credit_card,
    ),
    MenuItems(
      title: 'ProgressIndicator',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded,
    ),
    MenuItems(
      title: 'Snackbars y diálogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline,
    ),
    MenuItems(
      title: 'Animated container',
      subTitle: 'Stateful widget animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded,
    ),
    MenuItems(
      title: 'Ui Controls + Tiles',
      subTitle: 'Una serie de controles de Flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined,
    ),
    MenuItems(
      title: 'Tutorial de la App',
      subTitle: 'Pequeño tutorial de la app',
      link: '/tutorial',
      icon: Icons.accessible_rounded
    ),
    MenuItems(
      title: 'InfiniteScroll y Pull',
      subTitle: 'Listas infinitas y pull to refress',
      link: '/infinite',
      icon: Icons.list_alt_rounded,
    ),
  ];
