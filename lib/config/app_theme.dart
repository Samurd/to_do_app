import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 112, 10, 255);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int colorTheme;
  AppTheme({this.colorTheme = 0})
      : assert(colorTheme >= 0 && colorTheme < _colorThemes.length,
            'colorTheme must be greater than 0 and less than ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _colorThemes[colorTheme],
        brightness: Brightness.dark,
      ),
    );
  }
}
