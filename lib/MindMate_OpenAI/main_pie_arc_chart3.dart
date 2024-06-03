import 'dart:math' as math;

import 'package:flutter/material.dart';

class ArcChartView extends StatelessWidget {
  final double radius;
  final List<double> data;
  final List<Color> colors;

  const ArcChartView({super.key, required this.radius, required this.data, required this.colors});

  @override
  Widget build(BuildContext context) {
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

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Arc Chart Demo')),
      body: Center(
        child: ArcChartView(
          radius: 100,
          data: const [25, 40, 15, 20],
          colors: const [Colors.red, Colors.green, Colors.blue, Colors.purple],
        ),
      ),
    ),
  ));
}