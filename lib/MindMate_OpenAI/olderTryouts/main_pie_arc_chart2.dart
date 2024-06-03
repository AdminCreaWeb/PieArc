// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(home: MyApp()));
// }

// class PieData {
//   final String label;
//   final int value;
//   final charts.Color color;

//   PieData(this.label, this.value, this.color);
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   List<PieData> generateData() {
//     final data = [
//       PieData('Part 1', 25, charts.MaterialPalette.red.shadeDefault),
//       PieData('Part 2', 25, charts.MaterialPalette.green.shadeDefault),
//       PieData('Part 3', 25, charts.MaterialPalette.blue.shadeDefault),
//       PieData('Part 4', 25, charts.MaterialPalette.purple.shadeDefault),
//     ];
//     return data;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<PieData, String>> seriesList = [
//       charts.Series<PieData, String>(
//         id: 'pieData',
//         domainFn: (PieData data, _) => data.label,
//         measureFn: (PieData data, _) => data.value,
//         colorFn: (PieData data, _) => data.color,
//         data: generateData(),
//         labelAccessorFn: (PieData data, _) => '${data.value}%',
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(title: const Text("Pie Chart")),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SizedBox(
//             width: 300,
//             height: 300,
//             child: charts.PieChart(
//               seriesList,
//               animate: true,
//               defaultRenderer: charts.ArcRendererConfig(
//                 arcRendererDecorators: [
//                   charts.ArcLabelDecorator(
//                     labelPosition: charts.ArcLabelPosition.inside,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
