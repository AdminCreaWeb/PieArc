import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String title = 'Pie  chart';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyCombiPieArc(title: title),
    );
  }
}

class MyCombiPieArc extends StatelessWidget{
  const MyCombiPieArc({super.key, required this.title});

  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.amber),
      body: Center(
        child: PieChart(PieChartData(
          centerSpaceRadius: 0,
          borderData: FlBorderData(show: false),
          sections: [
            PieChartSectionData(value: 25, color: Colors.pink, radius: 100),
            PieChartSectionData(value: 25, color: Colors.blue, radius: 100),
            PieChartSectionData(value: 25, color: Colors.purple, radius: 100),
            PieChartSectionData(value: 25, color: Colors.green, radius: 100),
          ]
        )),),
    );
  }
}