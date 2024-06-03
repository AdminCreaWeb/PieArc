import 'package:charts_flutter/flutter.dart' as charts;

class PieData {
  final String label;
  final int value;
  final charts.Color color;  // Use charts.Color for custom colors

  PieData(this.label, this.value, this.color);
}