import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
    : assert(selectedColor >= 0, 'El color tiene que ser mayor que cero'),
      assert(
        selectedColor < colorList.length,
        'El color tiene que ser menor que ${colorList.length}',
      );

  ThemeData getTheme() =>
      ThemeData(
        useMaterial3: true, 
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: AppBarTheme(
          centerTitle: false,
          color: colorList[selectedColor],
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ));
  
  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) {
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
