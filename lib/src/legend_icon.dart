import 'package:flutter/material.dart';

enum LegendShape { square, circle, line }

class LegendIcon extends StatelessWidget {
  final LegendShape shape;
  final Color color;
  final double size;

  const LegendIcon({
    super.key,
    required this.shape,
    required this.color,
    this.size = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    switch (shape) {
      case LegendShape.square:
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: color,
          ),
          width: size,
          height: size,
        );
      case LegendShape.circle:
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          width: size,
          height: size,
        );
      case LegendShape.line:
        return SizedBox.square(
          dimension: size,
          child: Align(
            alignment: Alignment.center,
            child: ColoredBox(
              color: color,
              child: SizedBox(
                height: 2,
                width: size,
              ),
            ),
          ),
        );
    }
  }
}
