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
}
