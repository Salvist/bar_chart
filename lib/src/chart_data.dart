import 'dart:ui';

class ChartData {
  final String label;
  final double value;
  final Color? color;

  const ChartData({
    required this.label,
    required this.value,
    this.color,
  });

  ChartData copyWith({
    double? value,
  }) =>
      ChartData(
        label: label,
        value: value ?? this.value,
        color: color,
      );
}
