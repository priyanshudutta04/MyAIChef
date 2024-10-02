import 'package:flutter/material.dart';

class SemicirclePainter extends CustomPainter {
  final Color color;
  final double height;

  SemicirclePainter({required this.color, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;

    // Create a path for the semicircle
    final Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, height);
    path.quadraticBezierTo(size.width / 2, height + 50, 0, height);
    path.lineTo(0, 0);
    path.close();

    // Draw the semicircle
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}