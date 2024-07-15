import 'dart:math';

import 'package:bar_chart/src/bar.dart';
import 'package:bar_chart/src/chart_data.dart';
import 'package:bar_chart/src/decorator.dart';
import 'package:bar_chart/src/milestone.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<ChartData> dataSource;
  final double height;

  /// Set a dynamic highest milestone
  ///
  /// See an example of this package for more information.
  final double Function(double dataHighestValue)? highestMilestone;
  final MilestoneDecoration milestoneDecoration;

  final BarDecoration barDecoration;

  final bool shrinkWrap;

  const BarChart({
    super.key,
    required this.dataSource,
    this.height = 320,
    this.highestMilestone,
    this.milestoneDecoration = const MilestoneDecoration(),
    this.barDecoration = const BarDecoration(),
    this.shrinkWrap = true,
  });

  static const _milestoneVerticalPadding = 8.0;
  static const _barLabelHeight = 40.0;

  double get maxBarHeight => height - (_milestoneVerticalPadding * 2) - _barLabelHeight;

  double getBarHeight(double value, double highestMilestone) => maxBarHeight * value / highestMilestone;

  @override
  Widget build(BuildContext context) {
    final dataMaxValue = dataSource.map((data) => data.value).reduce(max);
    final highestMilestone = this.highestMilestone?.call(dataMaxValue) ?? dataMaxValue;

    Widget chart = Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              MilestoneLines(step: milestoneDecoration.step),
              Positioned(
                left: 0,
                top: _milestoneVerticalPadding,
                right: 0,
                bottom: _milestoneVerticalPadding,
                child: _buildBars(context, highestMilestone),
              ),
            ],
          ),
        ),
        _buildLabels(),
      ],
    );

    chart = shrinkWrap ? IntrinsicWidth(child: chart) : Expanded(child: chart);

    return SizedBox(
      height: height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MilestoneIndicators(
            labelPadding: _barLabelHeight,
            highestMilestone: highestMilestone,
            decoration: milestoneDecoration,
          ),
          chart,
        ],
      ),
    );
  }

  Widget _buildBars(BuildContext context, double highestMilestone) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...dataSource.map(
          (e) => Bar(
            decoration: barDecoration,
            height: getBarHeight(e.value, highestMilestone),
            color: e.color ?? barDecoration.color ?? Theme.of(context).primaryColor,
            value: e.value,
          ),
        ),
      ],
    );
  }

  Widget _buildLabels() {
    return SizedBox(
      height: _barLabelHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          dataSource.length,
          (index) {
            final data = dataSource[index];
            return SizedBox(
              width: barDecoration.labelWidth,
              child: Text(data.label, textAlign: TextAlign.center),
            );
          },
        ),
      ),
    );
  }
}
