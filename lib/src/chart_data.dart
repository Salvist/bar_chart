import 'dart:ui';

class ChartData {
  final String label;
  final double value;

  /// This will override and set an individual bar color
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

  static List<ChartData> fromMap(Map<String, double> data) {
    final list = <ChartData>[];
    for (final entry in data.entries) {
      list.add(
        ChartData(label: entry.key, value: entry.value),
      );
    }
    return list;
  }
}
