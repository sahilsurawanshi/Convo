import 'package:flutter/material.dart';

class Colours {
  static LinearGradient bgGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFC6C6C6),
      Color(0xFF999999),
      Color(0xFF666666),
      Color(0xFF000000),
      Color(0xFF000000),
    ],
  );
  // -------------------------------
  // 🌑 Base colors
  // -------------------------------
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color softWhite = Color(0xB3FFFFFF);
  static Color glassWhite = Color(0x1AFFFFFF);
  static Color glassFill = Color(0x14FFFFFF);
  static Color glassBorder = Color(0x2EFFFFFF);
  static Color primaryGlow = Colors.blueAccent;
  static LinearGradient sideGlowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xAA448AFF), Colors.transparent],
  );
  static RadialGradient glowBlob = RadialGradient(
    colors: [Color(0x66448AFF), Colors.transparent],
  );
}
