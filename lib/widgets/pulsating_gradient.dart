import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PulsatingGradientContainer extends StatefulWidget {
  @override
  _PulsatingGradientContainerState createState() =>
      _PulsatingGradientContainerState();
}

class _PulsatingGradientContainerState
    extends State<PulsatingGradientContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Shimmer.fromColors(
          direction: ShimmerDirection.ltr,
          baseColor: const Color.fromARGB(255, 143, 143, 143)!,
          highlightColor: Color.fromARGB(255, 106, 106, 106)!,
          period: Duration(milliseconds: 1000),
          child: Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.purple,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [_controller.value - 0.2, _controller.value + 0.2],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}