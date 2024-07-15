class ChartData {
  final String label;
  final double value;

  const ChartData({
    required this.label,
    required this.value,
  });

  ChartData copyWith({
    double? value,
  }) =>
      ChartData(
        label: label,
        value: value ?? this.value,
      );
}
