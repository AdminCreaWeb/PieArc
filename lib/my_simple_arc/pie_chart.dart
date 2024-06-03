import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart'; // import the package

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pie Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pie Chart Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, double> data = {};
  bool _loadChart = false;

  @override
  void initState() {
    data.addAll({
      'Flutter': 37136,
      'React Native': 69687,
      'Xamarin': 40609,
      'Ionic': 42544
    });
    super.initState();
  }

  final List<Color> _colors = [
    Colors.teal,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.redAccent
  ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Number of Questions asked on StackOverflow',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          _loadChart ? PieChart(
            dataMap: data,
            colorList:
            _colors, // if not declared, random colors will be chosen
            animationDuration: const Duration(milliseconds: 1500),
            chartLegendSpacing: 32.0,
            chartRadius: MediaQuery.of(context).size.width / 2.7, //determines the size of the chart
            // showChartValuesInPercentage: true,
            // showChartValues: true,
            // showChartValuesOutside: false,
            // chartValueBackgroundColor: Colors.grey[200],
            // showLegends: true,
            // legendPosition: LegendPosition.right, //can be changed to top, left, bottom
            // decimalPlaces: 1,
            // showChartValueLabel: true,
            // initialAngle: 0,
            // chartValueStyle: defaultChartValueStyle.copyWith(
              // color: Colors.blueGrey[900].withOpacity(0.9),
            // ),
            chartType: ChartType.disc, //can be changed to ChartType.ring
          ) : const SizedBox(height: 150,),
          const SizedBox(height: 50,),
          ElevatedButton(
            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),
            onPressed: () {
              setState(() {
                _loadChart = true;
              });
            },
            child: const Text('Click to Show Chart', style: TextStyle(color: Colors.blue))
          ),
        ],
      ),
    ));
  }
}