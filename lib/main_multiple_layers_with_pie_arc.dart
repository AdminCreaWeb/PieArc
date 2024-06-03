import 'package:flutter/material.dart';
// import 'package:combo_pie_arc_chart/main_combo_pie_arc.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: PieArcChart(
              data: const [
                PieArcChartData(Colors.purple, 25),
                PieArcChartData(Colors.blue, 25),
                PieArcChartData(Colors.orange, 25),
                PieArcChartData(Colors.green, 25),
              ],
              radius: 70,),
      //     child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     // Non-border heart
      //     CustomPaint(
      //       size: const Size(280, 260),
      //       painter: PieArcPainter(strokeWidth, data),
      //     ),
        // ],
      ),
    );
  }
}


// this is used to pass data about chart values to the widget
class PieArcChartData {
  const PieArcChartData(this.color, this.percent);

  final Color color;
  final double percent;
}

// our pie chart widget
class PieArcChart extends StatelessWidget {
  PieArcChart({
    required this.data,
    required this.radius,
    this.strokeWidth = 8,
    this.child,
    super.key,
  })  : // make sure sum of data is never ovr 100 percent
        assert(data.fold<double>(0, (sum, data) => sum + data.percent) <= 100);

  final List<PieArcChartData> data;
  // radius of chart
  final double radius;
  // width of stroke
  final double strokeWidth;
  // optional child; can be used for text for example
  final Widget? child;

  @override
  Widget build(context) {
    return CustomPaint(
      painter: _Painter(strokeWidth, data),
      size: Size.square(radius),
      child: SizedBox.square(
        // calc diameter
        dimension: radius * 2,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

// responsible for painting our chart
class _PainterData {
  const _PainterData(this.paint, this.radians);

  final Paint paint;
  final double radians;
}

class _Painter extends CustomPainter {
  _Painter(double strokeWidth, List<PieArcChartData> data) {
    // convert chart data to painter data
    dataList = data
        .map((e) => _PainterData(
              Paint()
                ..color = e.color
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth
                ..strokeCap = StrokeCap.round,
              // remove padding from stroke
              (e.percent - _padding) * _percentInRadians,
            ))
        .toList();
  }

  static const _percentInRadians = 0.062831853071796;
  static const _padding = 0;
  static const _paddingInRadians = _percentInRadians * _padding;
  // 0 radians is to the right, but since we want to start from the top
  // we'll use -90 degrees in radians
  static const _startAngle = -1.570796 + _paddingInRadians / 2;

  late final List<_PainterData> dataList;

  @override
  void paint(Canvas canvas, Size size) {
    
    final rect = Offset.zero & size;
    // keep track of start angle for next stroke
    double startAngle = _startAngle;

    // Create a new layer
    canvas.saveLayer(rect, Paint());

        // Draw on the saved layer
    // canvas.drawRect(const Rect.fromLTRB(0, 0, 200, 200), Paint()..color = Colors.amber);

    // Restore the saved layer
    canvas.restore();

    for (final data in dataList) {
      final path = Path()..addArc(rect, startAngle, data.radians);
      startAngle += data.radians + _paddingInRadians;
      canvas.drawPath(path, data.paint);
    }


    // Draw on the saved layer
    //canvas.drawRect(const Rect.fromLTRB(50, 50, 200, 200), Paint()..color = Colors.amber);
    var data = dataList[0];
    var path = Path()..addArc(rect, startAngle, data.radians);
    startAngle += data.radians + _paddingInRadians;
    // canvas.drawPath(path, data.paint);

    data = dataList[1];
    path = Path()..addArc(rect, startAngle, data.radians);
    startAngle += data.radians + _paddingInRadians;
    //canvas.drawPath(path, data.paint);
    startAngle = 0;
    var sweepAngle = 0.25;
    var useCenter = true;
    // canvas.drawArc(rect, startAngle, sweepAngle, useCenter, data.paint);
    // canvas.drawPath(path, data.paint);

    // Draw on the original canvas
    //canvas.drawCircle(const Offset(100, 100), 50, Paint()..color = Colors.blueGrey);
    data = dataList[2];
    // var customRadians = data.radians + 0;
    var customRadians = data.radians;
    path = Path()..addArc(rect, startAngle, customRadians);
    startAngle += customRadians + _paddingInRadians;
    // canvas.drawPath(path, data.paint);

    data = dataList[3];
    customRadians = data.radians + 0.01;
    path = Path()..addArc(rect, startAngle, customRadians);
    startAngle += customRadians + _paddingInRadians;
    // canvas.drawPath(path, data.paint);

    canvas.saveLayer(rect, Paint());

    // Restore the saved layer
    canvas.restore();


    customRadians = data.radians + 0.025;
    for (final data in dataList) {
      final path = Path()..addArc(rect, startAngle, customRadians);
      startAngle += data.radians + _paddingInRadians;
      canvas.drawPath(path, data.paint);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}



// final rect = Offset.zero & size;
//     // keep track of start angle for next stroke
//     double startAngle = _startAngle;

//     for (final data in dataList) {
//       final path = Path()..addArc(rect, startAngle, data.radians);

//       startAngle += data.radians + _paddingInRadians;

//       canvas.drawPath(path, data.paint);
//     }

// class DrawInLayers extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
    
    
//   }
// }