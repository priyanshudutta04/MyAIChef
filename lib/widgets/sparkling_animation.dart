import 'dart:math';

import 'package:flutter/material.dart';

class SparklingAnimation extends StatefulWidget {
  final Widget child;

  const SparklingAnimation({required this.child});

  @override
  _SparklingAnimationState createState() => _SparklingAnimationState();
}

class _SparklingAnimationState extends State<SparklingAnimation> with SingleTickerProviderStateMixin {
  final Random random = Random();
  final List<List<Offset>> _sparkleTrails = []; // Stores a list of previous positions for each star
  final List<double> _sparkleOpacities = [];
  final List<Offset> _velocity = [];
  late AnimationController _controller;

  final double maxSpeed = 0.3;  // Slow down the movement
  final int trailLength = 10; // Number of trail positions to store for each star

  @override
  void initState() {
    super.initState();

    // Initialize stars with trails
    for (int i = 0; i < 10; i++) {
      // Initialize each star's trail with its starting position
      List<Offset> initialTrail = List.generate(
        trailLength,
        (_) => Offset(random.nextDouble() * 200, random.nextDouble() * 200),
      );

      _sparkleTrails.add(initialTrail);
      _sparkleOpacities.add(random.nextDouble() * 0.5 + 0.5);

      _velocity.add(Offset(
        random.nextDouble() * maxSpeed * 2 - maxSpeed,
        random.nextDouble() * maxSpeed * 2 - maxSpeed,
      ));
    }

    _controller = AnimationController(
      duration: const Duration(milliseconds: 16),
      vsync: this,
    )..repeat();

    _controller.addListener(() {
      for (int i = 0; i < _sparkleTrails.length; i++) {
        // Update the trail by removing the oldest position and adding the new position
        List<Offset> trail = _sparkleTrails[i];

        Offset newPosition = trail.last + _velocity[i];

        // Ensure the new position stays within bounds
        if (newPosition.dx < 0 || newPosition.dx > 200) {
          _velocity[i] = Offset(-_velocity[i].dx, _velocity[i].dy);
        }
        if (newPosition.dy < 0 || newPosition.dy > 200) {
          _velocity[i] = Offset(_velocity[i].dx, -_velocity[i].dy);
        }

        // Add new position at the end and remove the oldest position
        trail.add(newPosition);
        if (trail.length > trailLength) {
          trail.removeAt(0);
        }

        _sparkleTrails[i] = trail;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(  // This restricts the drawing area of CustomPaint
      child: Stack(
        children: [
          widget.child,
          Positioned.fill(
            child: CustomPaint(
              painter: SparklingPainter(
                sparkleTrails: _sparkleTrails,
                sparkleOpacities: _sparkleOpacities,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SparklingPainter extends CustomPainter {
  final List<List<Offset>> sparkleTrails;
  final List<double> sparkleOpacities;

  SparklingPainter({
    required this.sparkleTrails,
    required this.sparkleOpacities,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (int i = 0; i < sparkleTrails.length; i++) {
      final List<Offset> trail = sparkleTrails[i];
      final double opacity = sparkleOpacities[i];

      // Draw the trail, fading out with each previous position
      for (int j = 0; j < trail.length - 1; j++) {
        final Offset start = trail[j];
        final Offset end = trail[j + 1];

        // Create a fading effect by decreasing opacity for older positions
        paint.color = Colors.white.withOpacity(opacity * (j + 1) / trail.length);

        // Draw a line segment for the trail
        canvas.drawLine(start, end, paint);
      }

      // Draw the current star (last position in the trail)
      paint.color = Colors.white.withOpacity(opacity);
      drawStar(canvas, trail.last.dx, trail.last.dy, paint);
    }
  }

  void drawStar(Canvas canvas, double x, double y, Paint paint) {
    final path = Path();
    const double radius = 5.0;
    path.moveTo(x, y - radius);
    for (int i = 1; i <= 5; i++) {
      path.lineTo(
        x + radius * cos((i * 2 * pi) / 5),
        y - radius * sin((i * 2 * pi) / 5),
      );
      path.lineTo(
        x + (radius / 2) * cos(((i * 2 + 1) * pi) / 5),
        y - (radius / 2) * sin(((i * 2 + 1) * pi) / 5));
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
