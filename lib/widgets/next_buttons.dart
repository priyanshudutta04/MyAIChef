import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NextButton extends StatelessWidget {
  final String text;
  NextButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.cardColor,
        ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}