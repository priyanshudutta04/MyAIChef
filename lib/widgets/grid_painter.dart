import 'package:flutter/material.dart';

class GridPatternPainter extends CustomPainter {
  final double padding; 
  final double dotSize; 

  GridPatternPainter({this.padding = 20.0, this.dotSize = 1.5});

  @override
  void paint(Canvas canvas, Size size) {
    final List<Offset> circlePositions = [
      Offset(size.width * 0.03, size.height * 0.6),
      Offset(size.width * 0.7, size.height * 0.3), 
      Offset(size.width * 0.9, size.height * 0.8), 
    ];

    for (var position in circlePositions) {
      canvas.drawCircle(position, 80.0, Paint()..color = Color.fromRGBO(244, 244, 244, 1));
      
      final Paint gradientPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            Color.fromRGBO(255, 178, 0, 1).withOpacity(0.3), 
            Color.fromRGBO(255, 178, 0, 1).withOpacity(0.1),  
            Color.fromRGBO(255, 178, 0, 1).withOpacity(0.0),  
          ],
          stops: [0.1,0.8, 1.0], 
        ).createShader(Rect.fromCircle(center: position, radius: 80.0));

      canvas.drawCircle(position, 80.0, gradientPaint);
    }

    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.2) 
      ..style = PaintingStyle.fill; 

    final double spacing = 10.0; 

    for (double x = padding + spacing; x < size.width - padding; x += spacing) {
      for (double y = padding; y < size.height - padding; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotSize, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
