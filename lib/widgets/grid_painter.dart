import 'package:flutter/material.dart';

class GridPatternPainter extends CustomPainter {
  final double padding; 
  final double dotSize; 

  GridPatternPainter({this.padding = 20.0, this.dotSize = 1.5});

  @override
  void paint(Canvas canvas, Size size) {
    // Define positions for the large circles
    final List<Offset> circlePositions = [
      Offset(size.width * 0.03, size.height * 0.6), // Large circle 1
      Offset(size.width * 0.7, size.height * 0.3), // Large circle 2
      Offset(size.width * 0.9, size.height * 0.8), // Large circle 3
    ];

    // Draw three large circles in specified positions
    for (var position in circlePositions) {
      // Draw the base blue circle
      canvas.drawCircle(position, 80.0, Paint()..color = Color.fromRGBO(244, 244, 244, 1));
      
      // Create a paint for the gradient effect
      final Paint gradientPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            Color.fromRGBO(255, 178, 0, 1).withOpacity(0.3), // Center color
            Color.fromRGBO(255, 178, 0, 1).withOpacity(0.1),  // Fade out color
            Color.fromRGBO(255, 178, 0, 1).withOpacity(0.0),  // Fade out color
          ],
          stops: [0.1,0.8, 1.0], // Where the colors should start and end
        ).createShader(Rect.fromCircle(center: position, radius: 80.0));

      // Draw the gradient circle on top of the blue circle
      canvas.drawCircle(position, 80.0, gradientPaint);
    }

    // Now draw the grid of small dots on top of the circles
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.2) 
      ..style = PaintingStyle.fill; 

    final double spacing = 10.0; 

    // Draw the grid of small dots
    for (double x = padding + spacing; x < size.width - padding; x += spacing) {
      for (double y = padding; y < size.height - padding; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotSize, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
