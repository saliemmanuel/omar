import 'package:flutter/material.dart';

class Palette {
  static Color kPrimaryColor = const Color(0xff3371FF);
  static Color kDarkBlackColor = const Color(0xFF191919);
  static Color kBgColor = const Color(0xFFE7E7E7);
  static Color kBodyTextColor = const Color(0xFF666666);

  static double kDefaultPadding = 20.0;
  static double kMaxWidth = 1232.0;
  static Duration kDefaultDuration = const Duration(milliseconds: 250);

  static Color primaryColor = const Color(0xff3371FF);

  static Color footerColors = const Color.fromARGB(255, 18, 18, 18);

  static Color textButtonLabelColors = const Color.fromARGB(255, 119, 117, 117);
  static Color textFooterColors = const Color.fromARGB(255, 251, 247, 247);
  static LinearGradient gradientLogin = const LinearGradient(
    end: Alignment.bottomCenter,
    begin: Alignment.topCenter,
    colors: [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Color(0xff3371FF),
      Color(0xff8426D6),
    ],
  );
}
