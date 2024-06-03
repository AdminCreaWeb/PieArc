// import 'dart:math';

// import 'package:flutter/material.dart';

// class MySimpleArc extends StatelessWidget {
//   const MySimpleArc({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: const Size(500, 500),
//       painter: PieArcChartData(),
//     );
//   }
// }

// class PieArcChartData {
//   PieArcChartData(this.color, this.percent, this.radians);

//   final Color color;
//   final double percent;
//   double radians = 0;
// }

// // responsible for painting our chart
// class _PainterData {
//   const _PainterData(this.paint, this.radians);

//   final Paint paint;
//   final double radians;
// }


// // our pie chart widget
// class PieArcChart extends StatelessWidget {
//   PieArcChart({
//     required this.data,
//     required this.radius,
//     this.strokeWidth = 8,
//     this.child,
//     super.key,
//   })  : // make sure sum of data is never ovr 100 percent
//         assert(data.fold<double>(0, (sum, data) => sum + data.percent) <= 100);

//   final List<PieArcChartData> data;
//   // radius of chart
//   final double radius;
//   // width of stroke
//   final double strokeWidth;
//   // optional child; can be used for text for example
//   final Widget? child;

//   @override
//   Widget build(context) {
//     return CustomPaint(
//       painter: MySimplePainter(strokeWidth, data),//_Painter(strokeWidth, data),
//       size: Size.square(radius),
//       child: SizedBox.square(
//         // calc diameter
//         dimension: radius * 2,
//         child: Center(
//           child: child,
//         ),
//       ),
//     );
//   }
// }

// class MySimplePainter extends CustomPainter {
//   MySimplePainter(double strokeWidth, List<PieArcChartData> data) {
//   dataList = data
//         .map((e) => _PainterData(
//               Paint()
//                 ..color = e.color
//                 ..style = PaintingStyle.stroke
//                 ..strokeWidth = strokeWidth
//                 ..strokeCap = StrokeCap.round,
//               // remove padding from stroke
//               (e.percent - _padding) * _percentInRadians,
//             ))
//         .toList();
//   }

//   @override
//   void paint(Canvas canvas, Size size) {
//     final strokeWidth = size.width / 30.0;

//     final paint = Paint()
//      ..color = Colors.black12
//      ..style = PaintingStyle.stroke
//      ..strokeWidth = strokeWidth
//      ..strokeCap = StrokeCap.round;
//     // final paint = Paint()
//     //  ..color = Colors.red
//     //  ..style = PaintingStyle.stroke
//     //  ..strokeWidth = 5
//     //  ..strokeCap = StrokeCap.round;

//     Offset circleCenter = Offset(size.width / 2, size.height / 2);
//     double circleRadius = (size.width - strokeWidth) / 3;
//     Rect rectangle =
//       Rect.fromCircle(center: circleCenter, radius: circleRadius);

//     double startAngle = 0;
//     double sweepAngle = (1 * pi) / 8;
//     bool useCenter = false;
    
//     canvas.drawPaint(paint);
//     canvas.drawArc(rectangle, startAngle, sweepAngle, useCenter, paint);
    
//     for (final data in dataList) {
//       final path = Path()..addArc(rect, startAngle, data.radians);
//       startAngle += data.radians + _paddingInRadians;
//       canvas.drawPath(path, data.paint);
//     }

//     final path = Path()..addArc(rect, startAngle, data.radians);
//     canvas.drawPath(path, paint)
//     // startAngle = pi
//     // canvas.drawArc(rectangle, (startAngle*2), sweepAngle, useCenter, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }