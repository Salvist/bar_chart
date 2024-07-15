import 'package:bar_chart/bar_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BarChartExampleScreen(),
    );
  }
}

class BarChartExampleScreen extends StatelessWidget {
  const BarChartExampleScreen({super.key});

  // This method sets the highest milestone to be progressive
  // as the value in the data source goes higher.
  // For example, in this particular method, it sets the upper limit of the milestone
  // to be a multiplication of 100.
  double progressiveMilestone(double dataHighestValue) {
    if (dataHighestValue % 100 == 0) return dataHighestValue;
    return (dataHighestValue ~/ 100) * 100 + 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BarChart(
            milestoneDecoration: const MilestoneDecoration(
              step: 5,
              suffixText: '%',
            ),
            highestMilestone: progressiveMilestone,
            dataSource: const <ChartData>[
              ChartData(
                label: 'Data 1',
                value: 25.0,
              ),
              ChartData(label: 'Data 2', value: 75.0),
              ChartData(label: 'Data 3', value: 50.0),
              ChartData(label: 'Data 4', value: 100.0),
            ],
          ),
        ],
      ),
    );
  }
}
