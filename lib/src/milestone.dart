import 'package:flutter/material.dart';

class MilestoneIndicators extends StatelessWidget {
  final double labelPadding;
  const MilestoneIndicators({
    super.key,
    this.labelPadding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: labelPadding + 2, top: 1, right: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          5,
          (index) => Text('${100 - (index * 25)}%'),
        ),
      ),
    );
  }
}

class MilestoneLines extends StatelessWidget {
  final Color? color;

  const MilestoneLines({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) => Divider(
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}
