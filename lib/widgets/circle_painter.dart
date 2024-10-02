import 'dart:ui';

import 'package:flutter/material.dart';

class ScatteredBallsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final circles = [
      Circle(Offset(100, 100), 25, Colors.amber),
      Circle(Offset(100, 400), 28, Colors.amber),
      Circle(Offset(350, 450), 10, Colors.amber),
      Circle(Offset(150, 550), 20, Colors.amber),

      Circle(Offset(350, 80), 27, Colors.amber),
      Circle(Offset(120, 200), 12, Colors.amber),
      Circle(Offset(290, 250), 22, Colors.amber),
      Circle(Offset(50, 500), 15, Colors.amber),
      Circle(Offset(280, 350), 29, Colors.amber),

      Circle(Offset(300, 500), 14, Colors.amber),
      Circle(Offset(100, 620), 20, Colors.amber),
    ];

    for (final circle in circles) {
      paint.color = circle.color;
      canvas.drawCircle(circle.position, circle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; 
  }
}


class Circle {
  final Offset position;
  final double radius;
  final Color color;

  Circle(this.position, this.radius, this.color);
}