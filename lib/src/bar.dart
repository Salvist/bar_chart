import 'package:bar_chart/src/decorator.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final double height;
  final Color? color;
  final double? value;

  final BarDecoration decoration;

  const Bar({
    super.key,
    required this.decoration,
    this.color,
    required this.height,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    Widget? valueText;
    if (value != null) {
      valueText = DefaultTextStyle.merge(
        style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onPrimary),
        child: Text('$value', style: decoration.valueStyle),
      );
    }

    final horizontalMargin = (decoration.labelWidth - decoration.width) / 2;

    return Container(
      decoration: BoxDecoration(
        borderRadius: decoration.borderRadius,
        color: color,
      ),
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      width: decoration.width,
      height: height,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 2),
      child: valueText,
    );
  }
}
