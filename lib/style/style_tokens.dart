import 'package:flutter/cupertino.dart';

class StyleTokens {
  static const RadialGradient backgroundGradient = RadialGradient(
    colors: [
      mainBlue,
      mainBlack,
    ],
    center: Alignment.topRight,
    radius: 0.8,
  );

  static const Color mainBlue = Color(0xFF00BCD4);
  static const Color mainBlack = Color(0xFF000000);
  static const Color mainRed = Color(0xFFF3203A);
  static const Color mainGreen = Color(0xFF0B9854);
  static const Color mainWhite = Color(0xFFFFFFFF);

  static Color mainBlueTenPercent = mainBlue.withOpacity(0.1);
}
