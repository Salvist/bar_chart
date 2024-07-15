import 'package:flutter/material.dart';

class BarDecoration {
  final double width;
  final Color? color;
  final BorderRadius borderRadius;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  /// The width of the bar's label i.e. [width] * [labelWidthScale]
  ///
  /// Defaults to 2.0, cannot be less than 1.
  final double labelWidthScale;

  /// Display of the value in case decimals go crazy.
  ///
  /// Convert the value using toStringAsFixed()
  final String Function(double milestone)? displayValue;

  const BarDecoration({
    this.width = 40.0,
    this.color,
    this.borderRadius = const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
    this.labelWidthScale = 2.0,
    this.labelStyle,
    this.valueStyle,
    this.displayValue,
  }) : assert(labelWidthScale >= 1.0);

  double get labelWidth => width * labelWidthScale;
}

class MilestoneDecoration {
  /// The amount of milestone indicators/lines shown on the chart
  ///
  /// Minimum is 2.
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
  }) : assert(step >= 2);
}
