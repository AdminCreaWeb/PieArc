// /// Simple pie chart example.
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<LinearSales, int>> _createSampleData() {
//     final data = [
//       LinearSales(0, 100),
//       LinearSales(1, 75),
//       LinearSales(2, 25),
//       LinearSales(3, 5),
//     ];

//     return [
//       charts.Series<LinearSales, int>(
//         id: 'Sales',
//         domainFn: (LinearSales sales, _) => sales.year,
//         measureFn: (LinearSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Pie Chart Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const SimplePieChart(sanimate: false),
//     );
//   }
// }

// class SimplePieChart extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

//   const SimplePieChart(this.seriesList, {super.key, required this.animate});

//   /// Creates a [PieChart] with sample data and no transition.
//   factory SimplePieChart.withSampleData() {
//     return SimplePieChart(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }


//   @override
//   Widget build(BuildContext context) {
//     return charts.PieChart(seriesList, animate: animate);
//   }
// }

// /// Sample linear data type.
// class LinearSales {
//   final int year;
//   final int sales;

//   LinearSales(this.year, this.sales);
// }