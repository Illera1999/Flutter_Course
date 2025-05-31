



import 'package:flutter/material.dart';

class AppTheme {


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    // Generamos un esquema de colores partiendo de la semilla y forzamos brillo oscuro
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0096FF),
      brightness: Brightness.dark,
    ),
    // Color de fondo de todas las pantallas (Scaffold)
    scaffoldBackgroundColor: const Color(0xFF121212), // gris‑negro típico de dark mode
  );
}