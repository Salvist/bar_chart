import 'package:bar_chart/src/bar.dart';
import 'package:bar_chart/src/chart_data.dart';
import 'package:bar_chart/src/milestone.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<ChartData> dataSource;
  final double width;
  final double height;
  final double barWidth;
  final double barLabelWidth;

  const BarChart({
    super.key,
    required this.dataSource,
    this.width = 560.0,
    this.height = 320,
    this.barWidth = 40.0,
    this.barLabelWidth = 80.0,
  }) : assert(barLabelWidth > barWidth);

  static const _milestoneVerticalPadding = 8.0;
  static const _barLabelHeight = 40.0;

  double get maxBarHeight => height - (_milestoneVerticalPadding * 2) - _barLabelHeight - 1;

  double getBarHeight(double value) {
    return maxBarHeight * value / 100;
  }

  @override
  Widget build(BuildContext context) {
    final bars = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...dataSource.map(
          (e) => Bar(
            width: barWidth,
            labelWidth: barLabelWidth,
            height: getBarHeight(e.value),
            color: Colors.red,
          ),
        ),
      ],
    );

    final barLabels = SizedBox(
      height: _barLabelHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: dataSource
            .map(
              (e) => SizedBox(
                width: barLabelWidth,
                child: Text(
                  e.label,
                  textAlign: TextAlign.center,
                ),
              ),
            )
            .toList(),
      ),
    );

    return SizedBox(
      width: width,
      height: height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const MilestoneIndicators(
            labelPadding: _barLabelHeight,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    // fit: StackFit.expand,
                    children: [
                      const MilestoneLines(),
                      Positioned(
                        left: 0,
                        top: _milestoneVerticalPadding,
                        right: 0,
                        bottom: _milestoneVerticalPadding,
                        child: bars,
                      ),
                    ],
                  ),
                ),
                barLabels,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
