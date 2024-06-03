import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:combo_pie_arc_chart/MindMate_OpenAI/model/pie_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class PieData {
  final String label;
  final int value;
  final charts.Color color;  // Use charts.Color for custom colors

  PieData(this.label, this.value, this.color);
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<PieData> generateData() {
    final data = [
      PieData('Part 1', 25, charts.MaterialPalette.red.shadeDefault),
      PieData('Part 2', 25, charts.MaterialPalette.green.shadeDefault),
      PieData('Part 3', 25, charts.MaterialPalette.blue.shadeDefault),
      PieData('Part 4', 25, charts.MaterialPalette.purple.shadeDefault),
    ];
    
    List<PieData> result = [];
    for (var i = 0; i < data.length; i++) {
      result.add(PieData(data[i].label, data[i].value, data[i].color));
      result.add(PieData('', 100 - data[i].value, charts.MaterialPalette.transparent));
    }
    
    return result;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<charts.Series> seriesList = [
     charts.Series<PieData, String>(
       id: 'pieData',
       domainFn: (PieData data, _) => data.label,
       measureFn: (PieData data, _) => data.value,
       colorFn: (PieData data, _) => data.color,
      data: generateData(),
      labelAccessorFn: (PieData data, _) => '${data.value}%',
    )];
    // const String title = 'Pie  chart';
    return Scaffold(
      body:
      // charts.PieChart(
      //     [charts.Series<PieData, String>(
      //       id: 'pieData',
      //       domainFn: (PieData data, _) => data.label,
      //       measureFn: (PieData data, _) => data.value,
      //       colorFn: (PieData data, _) => data.color,
      //       data: generateData(),
      //       labelAccessorFn: (PieData data, _) => '${data.value}%',
      //     )],
      //     animate: true,
      //     // defaultRenderer: charts.ArcRendererConfig(arcRendererDecorators: [
      //     //   // Add decorators if necessary
      //     // ]),
      //     defaultRenderer: charts.ArcRendererConfig(
      //       arcRendererDecorators: <charts.ArcLabelDecorator>[
      //         charts.ArcLabelDecorator(
      //           labelPosition: charts.ArcLabelPosition.inside,
      //         ),
      //       ],
      //     ),
      // ),
    charts.PieChart(
          // [charts.Series<PieData, String>(
          //   id: 'pieData',
          //   domainFn: (PieData data, _) => data.label,
          //   measureFn: (PieData data, _) => data.value,
          //   colorFn: (PieData data, _) => data.color,
          //   data: generateData(),
          //   labelAccessorFn: (PieData data, _) => '${data.value}%',
          // )],
          seriesList,
          animate: true,
          defaultRenderer: charts.ArcRendererConfig(
            arcRendererDecorators: <charts.ArcLabelDecorator>[
              charts.ArcLabelDecorator(
                labelPosition: charts.ArcLabelPosition.inside,
              ),
            ],
          ),
      ),
    );
  }
}




