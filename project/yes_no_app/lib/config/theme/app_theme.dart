import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF556AE4);

const List<Color> _colorTheme = [
  _customColor,
  Color(0xFFE4A556),
  Color(0xFF56E4D9),
  Color(0xFFE45656),
  Color(0xFF56E456),
  Color(0xFFE456E4),
];

class AppTheme {
  final int selectodColor;

  AppTheme({this.selectodColor = 0})
    : assert(selectodColor >= 0 && selectodColor < _colorTheme.length);

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectodColor],
      // brightness: Brightness.dark
    );
  }
}
