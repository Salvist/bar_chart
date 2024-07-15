import 'package:bar_chart/bar_chart.dart';
import 'package:bar_chart/src/decorator.dart';
import 'package:flutter/material.dart';

class MilestoneIndicators extends StatelessWidget {
  final double labelPadding;

  final double highestMilestone;

  final MilestoneDecoration decoration;

  const MilestoneIndicators({
    super.key,
    this.labelPadding = 0.0,
    required this.decoration,
    required this.highestMilestone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: labelPadding - 2, right: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          decoration.step,
          (index) {
            final stepIncrease = highestMilestone / (decoration.step - 1);
            final milestone = highestMilestone - (index * stepIncrease);
            String displayMilestone;
            if (decoration.displayMilestone != null) {
              displayMilestone = decoration.displayMilestone!(milestone);
            } else {
              displayMilestone = '$milestone';
            }

            return Text('${decoration.prefixText ?? ''}$displayMilestone${decoration.suffixText ?? ''}');
          },
        ),
      ),
    );
  }
}

class MilestoneLines extends StatelessWidget {
  final int step;
  final Color? color;

  const MilestoneLines({
    super.key,
    required this.step,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        step,
        (index) => Divider(
          color: color ?? Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
