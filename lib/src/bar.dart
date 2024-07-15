import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double labelWidth;

  const Bar({
    super.key,
    this.width = 40,
    required this.height,
    required this.color,
    this.labelWidth = 56.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: color,
      ),
      margin: EdgeInsets.symmetric(horizontal: width / 2),
      width: width,
      height: height,
    );
  }
}
