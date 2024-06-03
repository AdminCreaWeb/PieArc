//Src: https://bartvwezel.nl/flutter/drawing-and-rotating-arcs-in-flutter/
//Src-dart-pad: https://dartpad.dev/?id=3d7b96e1cba0221d243f13ae25c6a759

// Some good explanation-src: https://letscaffold.com/the-basic-of-drawing-an-arc-with-custompaint/
// & here: https://api.flutter.dev/flutter/dart-ui/Canvas/drawArc.html
import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotating arc example',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rotating arc example'),
        ),
        body: const Center(
          child: Column(
            children: [
              ArcWidget(),
              ArcWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ArcWidget extends StatefulWidget {
  const ArcWidget({super.key});

  @override
  State<ArcWidget> createState() => _ArcWidgetState();
}

class _ArcWidgetState extends State<ArcWidget> {
  final double width = 250;
  final double height = 250;
  double baseAngle = 0;
  Offset? lastPosition;
  double lastBaseAngle = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: ArcPainter(100, baseAngle),
        child: GestureDetector(
          onVerticalDragStart: (value) {
            setInitialState(value);
          },
          onHorizontalDragUpdate: (value) {
            updateAngle(value);
          },
          onVerticalDragUpdate: (value) {
            updateAngle(value);
          },
          onHorizontalDragStart: (value) {
            setInitialState(value);
          },
        ),
      ),
    );
  }

  void updateAngle(DragUpdateDetails value) {
    double result = math.atan2(value.localPosition.dy - height/2, value.localPosition.dx - width/2) -
        math.atan2(lastPosition!.dy - height/2, lastPosition!.dx - width/2);
    setState(() {
      baseAngle = lastBaseAngle + result;
    });
  }

  void setInitialState(DragStartDetails value) {
    lastPosition = value.localPosition;
    lastBaseAngle = baseAngle;
  }
}

class ArcPainter extends CustomPainter {
  final double radius;
  double baseAngle;
  final Paint red = createPaintForColor(Colors.red);
  final Paint blue = createPaintForColor(Colors.blue);
  final Paint green = createPaintForColor(Colors.green);

  ArcPainter(this.radius, this.baseAngle);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius);
    canvas.drawArc(rect, baseAngle, sweepAngle(), false, blue);
    canvas.drawArc(rect, baseAngle + 2 / 3 * math.pi, sweepAngle(), false, red);
    canvas.drawArc(rect, baseAngle + 4 / 3 * math.pi, sweepAngle(), false, green);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  double sweepAngle() => 0.8 * 2 / 3 * math.pi;
}

Paint createPaintForColor(Color color) {
  return Paint()
    ..color = color
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 15;
}
