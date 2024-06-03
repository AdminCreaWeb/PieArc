import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Arc Chart Demo')),
      body: Center(
        child: ArcChartView(
          radius: 100,
          data: [
            ArcData(25, Colors.red),
            ArcData(35, Colors.green),
            ArcData(20, Colors.blue),
            ArcData(20, Colors.purple),
          ],
        ),
      ),
    ),
  ));
}

class ArcData {
  final double value;
  final Color color;

  ArcData(this.value, this.color);
}

class ArcChartView extends StatelessWidget {
  final double radius;
  final List<ArcData> data;

  const ArcChartView({super.key, required this.radius, required this.data});
  
  // List<PieData> generateData() {
  //   final data = [
  //     PieData('Part 1', 25, charts.MaterialPalette.red.shadeDefault),
  //     PieData('Part 2', 25, charts.MaterialPalette.green.shadeDefault),
  //     PieData('Part 3', 25, charts.MaterialPalette.blue.shadeDefault),
  //     PieData('Part 4', 25, charts.MaterialPalette.purple.shadeDefault),
  //   ];
    
  //   List<PieData> result = [];
  //   for (var i = 0; i < data.length; i++) {
  //     result.add(PieData(data[i].label, data[i].value, data[i].color));
  //     result.add(PieData('', 100 - data[i].value, charts.MaterialPalette.transparent));
  //   }
    
  //   return result;
  // }

  @override
  Widget build(BuildContext context) {
    final data = <double>[1.0, 1.0, 1.5, 1.5];
    final colors = <Color>[Colors.red, Colors.green, Colors.blue, Colors.purple];
    return CustomPaint(
      painter: ArcChartPainter(data: data, colors: colors),
      size: Size(radius * 2, radius * 2),
    );
  }
}

class ArcChartPainter extends CustomPainter {
  final List<double> data;
  final List<Color> colors;

  ArcChartPainter({required this.data, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    double total = data.reduce((a, b) => a + b);
    double startAngle = -math.pi / 2;

    for (int i = 0; i < data.length; i++) {
      double sweepAngle = (data[i] / total) * 2 * math.pi;
      _drawArc(canvas, size, startAngle, sweepAngle, colors[i]);
      startAngle += sweepAngle;
    }
  }

  void _drawArc(Canvas canvas, Size size, double startAngle, double sweepAngle, Color color) {
    final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width
      ..strokeCap = StrokeCap.round
      ..color = color;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
