import 'package:flutter/material.dart';

class CommonColors {
  static Color headlineTextColor = Colors.black;
  static Color accentColor = Colors.orange;
  static Color primaryColorDark = Colors.deepOrangeAccent;
  static Color iconColor = Colors.white;
  static Color bottomSheetColor = Colors.white;
  static Color cardColor = _getColor(0xfffafafa);
  static Color progressBarBackgroundColor = _getColor(0xffe0e0e0);

  static Map<int, Color> _color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  static MaterialColor _getColor(int primary) {
    return MaterialColor(primary, _color);
  }
}
