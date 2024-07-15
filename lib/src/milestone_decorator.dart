import 'dart:ui';

class MilestoneDecoration {
  /// The amount of milestone indicators/lines shown on the chart
  final int step;

  /// Set the line color. Defaults to Theme primary color
  final Color? lineColor;

  final String? prefixText;
  final String? suffixText;
  final TextStyle? indicatorStyle;

  /// Display of the milestone in case decimals go crazy.
  ///
  /// Convert the milestone using toStringAsFixed()
  final String Function(double milestone)? displayMilestone;

  const MilestoneDecoration({
    this.step = 5,
    this.lineColor,
    this.prefixText,
    this.suffixText,
    this.indicatorStyle,
    this.displayMilestone,
  });
}
