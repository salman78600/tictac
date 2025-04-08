import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final List<Shadow>? shadows;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,
          style: TextStyle(
            fontSize: fontSize,
            shadows: shadows,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
