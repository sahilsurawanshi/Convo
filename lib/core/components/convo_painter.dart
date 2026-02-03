import 'package:flutter/material.dart';

class ConvoSplashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFC6C6C6), // Ash Grey
          Color(0xFF999999), // Slate Grey
          Color(0xFF666666), // Shadow Grey
          Color(0xFF000000), // Deep Charcoal
          Color(0xFF000000), // Black
        ],
        stops: [0.0, 0.25, 0.5, 0.75, 1.0],
      ).createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
