import 'dart:math';

import 'package:flutter/material.dart';

class ArcPieComboChart extends StatelessWidget {
  const ArcPieComboChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(500, 500),
      painter: ArcPieComboPainter(),
    );
  }
}

class ArcPieComboPainter extends CustomPainter {
  // static const percent = 70;
  // static const _percentInRadians = 0.062831853071796;
  // static const _padding = 0;
  // static const _paddingInRadians = _percentInRadians * _padding;

  @override
  void paint(Canvas canvas, Size size) {
    // final strokeWidth = size.width / 20.0;

    // Offset circleCenter = Offset(size.width / 2, size.height / 2);
    // double circleRadius = (size.width - strokeWidth) / 2;

    double? startAngle = pi;
    double sweepAngle = (1 * pi) / 2;
    // bool useCenter = false;

    // final List<Color> _arcsColor = [
    //   Colors.yellow,
    //   Colors.orange,
    //   Colors.red,
    //   Colors.purple,
    //   Colors.blue
    // ];

    double quarterPart_Full = (pi / 2);
    double quarterPart_Half = (pi / 2) / 2;

    // part 1 of 4 [left to top => 90° clockwise] :
    paintPieArcsSection(canvas, size, Colors.yellow, 5, pi, quarterPart_Full);

    // part 2 of 4 [top to right => 90° clockwise] :
    paintPieArcsSection(
        canvas, size, Colors.orange, 4, pi * 1.5, quarterPart_Half);
    paintPieArcsSection(canvas, size, Colors.orange, 4,
        (pi * 1.5) + (quarterPart_Half), quarterPart_Half);

    // part 3 of 4 [left to top => 90° clockwise] :
    paintPieArcsSection(
        canvas, size, Colors.green, 1, pi * 2, quarterPart_Half / 2);
    paintPieArcsSection(canvas, size, Colors.purple, 2,
        pi * 2 + (quarterPart_Half / 2), quarterPart_Half / 2);
    paintPieArcsSection(canvas, size, Colors.pink, 3,
        pi * 2 + (quarterPart_Half), quarterPart_Half / 2);
    paintPieArcsSection(
        canvas,
        size,
        Colors.deepOrange,
        4,
        pi * 2 + (quarterPart_Half) + (quarterPart_Half / 2),
        quarterPart_Half / 2);

    // part 4 of 4 [top to right => 90° clockwise] :
    paintPieArcsSection(
        canvas, size, Colors.blue, 3, pi * 2.5, quarterPart_Full / 3);
    paintPieArcsSection(canvas, size, Colors.blue, 2,
        pi * 2.5 + (quarterPart_Full / 3), quarterPart_Full / 3);
    paintPieArcsSection(canvas, size, Colors.blue, 2,
        pi * 2.5 + (2 * (quarterPart_Full / 3)), quarterPart_Full / 3);
//    paintPieArcsSection(canvas, size, Colors.blue, 2, pi*2.5, (1 * pi) / 2);

//     final paint1 = Paint()
//      ..color = Colors.yellow
//      ..style = PaintingStyle.fill
//      ..strokeWidth = strokeWidth
//      ..strokeCap = StrokeCap.butt;
//     bool useCenter = true;

//     // canvas.drawPaint(paint);
//     // canvas.drawArc(rectangle, startAngle, sweepAngle, useCenter, paint);
// // final left = degreeOptions.initialAngle >= -90 && degreeOptions.totalDegrees <= 180 ? -size.width / 2 : 0.0;

// // const top = 0.0;

// // final Rect boundingSquare = Rect.fromLTWH(left, top, side, size.height);
//     Rect rectangle1 =
//       Rect.fromCircle(center: circleCenter, radius: (circleRadius)-(strokeWidth*8.5));

//     // final path = Path()..addArc(rectangle1, startAngle, sweepAngle);
//     // canvas.drawPath(path, paint1);
//   canvas.drawArc(rectangle1, startAngle, sweepAngle, useCenter, paint1);

//   //   // Create a new layer
//   //   canvas.saveLayer(rectangle1, Paint());

//   //  // Restore the saved layer
//   //   canvas.restore();

//     final paint2 = Paint()
//       ..color = Colors.orange
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.butt;
//     useCenter = false;

//     Rect rectangle2 =
//       Rect.fromCircle(center: circleCenter, radius: circleRadius-(strokeWidth*8));
// final path2 = Path()..addArc(rectangle2, startAngle, sweepAngle);
// canvas.drawPath(path2, paint2);
//     // canvas.drawArc(rectangle2, startAngle, sweepAngle, useCenter, paint2);

    //   // Create a new layer
    //   canvas.saveLayer(rectangle2, Paint());

    //  // Restore the saved layer
    //   canvas.restore();

//     final paint3 = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.butt;
//     // useCenter = false;

//     Rect rectangle3 =
//       Rect.fromCircle(center: circleCenter, radius: circleRadius-(strokeWidth*7));
//  final path3 = Path()..addArc(rectangle3, startAngle, sweepAngle);
// canvas.drawPath(path3, paint3);
//     // canvas.drawArc(rectangle3, startAngle, sweepAngle, useCenter, paint3);

    //     // Create a new layer
    //   canvas.saveLayer(rectangle3, Paint());

    //  // Restore the saved layer
    //   canvas.restore();

//     final paint4 = Paint()
//       ..color = Colors.purple
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.butt;
//     //  useCenter = false;

//     Rect rectangle4 =
//       Rect.fromCircle(center: circleCenter, radius: circleRadius-(strokeWidth*6));
// final path4 = Path()..addArc(rectangle4, startAngle, sweepAngle);
// canvas.drawPath(path4, paint4);
//     // canvas.drawArc(rectangle4, startAngle, sweepAngle, useCenter, paint4);

    // // Create a new layer
    // canvas.saveLayer(rectangle4, Paint());

    // // Restore the saved layer
    // canvas.restore();

//     final paint5 = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.butt;
//     //  useCenter = false;

//     Rect rectangle5 =
//       Rect.fromCircle(center: circleCenter, radius: circleRadius-(strokeWidth*5));
// final path5 = Path()..addArc(rectangle5, startAngle, sweepAngle);
// canvas.drawPath(path5, paint5);
//     // canvas.drawArc(rectangle5, startAngle, sweepAngle, useCenter, paint5);

    //       // Draw on the saved layer
    //   // canvas.drawRect(const Rect.fromLTRB(0, 0, 200, 200), Paint()..color = Colors.amber);

    //   // Restore the saved layer
    //   canvas.restore();

    //   final paint6 = Paint()
    //    ..color = Colors.red
    //    ..style = PaintingStyle.fill
    //    ..strokeWidth = strokeWidth
    //    ..strokeCap = StrokeCap.butt;
    //   useCenter = true;
    //   startAngle = pi / 2;
    //   sweepAngle = (1 * pi) / 2;

    // Rect rectangle6 =
    //   Rect.fromCircle(center: circleCenter, radius: circleRadius*1.5);

    // canvas.drawArc(rectangle6, startAngle, sweepAngle, useCenter, paint6);
    // // canvas.drawArc(rectangle, (startAngle*2), sweepAngle, useCenter, paint);

    //    // Create a new layer
    //   canvas.saveLayer(rectangle4, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Canvas paintPieArcsSection(
    Canvas canvas,
    Size size,
    //List<Color> arcsColorList,
    Color arcColor,
    int countArcs,
    double circlePartsStartAngle,
    double circlePartSweepAngle,
  ) {
    // final List<Paint> _paintList = [];

    // final arcsCount = arcsColorList.length;
    print(countArcs);
    if (countArcs > 0) {
      // (arcsColorList.isNotEmpty || arcColor != null) && ( countArcs > 0) && (countArcs <= arcsCount)
      final strokeWidth = size.width / 20.0; // [FIXED] Has to stay 20.0s!!!

      Offset circleCenter = Offset(size.width / 2, size.height / 2);
      double circleRadius = (size.width - strokeWidth) / 2;

      // double startAngle = pi;
      double startAngle = circlePartsStartAngle;
      double sweepAngle = circlePartSweepAngle;
      bool useCenter = true;

      var arcsDefinedColor = arcColor; // arcsColorList[countArcs-1];

      final paint0 = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.butt;

      final paint1 = Paint()
        ..color = arcsDefinedColor
        ..style = PaintingStyle.fill
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt;

      Rect rectangle1 = Rect.fromCircle(
          center: circleCenter, radius: (circleRadius) - (strokeWidth * 8.5));

      // final path = Path()..addArc(rectangle1, startAngle, sweepAngle);
      // canvas.drawPath(path, paint1);
      canvas.drawArc(rectangle1, startAngle, sweepAngle, useCenter, paint1);
      canvas.drawArc(rectangle1, startAngle, sweepAngle, useCenter, paint0);

      // if(arcsCount > 1) {
      if (countArcs > 1) {
        // for (int i = 1; i < arcsCount; i++) {
        for (int i = 1; i < countArcs; i++) {
          // code from chart_painter definition (=> via pie_chart.dart definition)
          // final paint = Paint()..color = getColor(colorList, i);
          // setPaintProps(paint);
          // _paintList.add(paint);

          arcsDefinedColor =
              arcColor; // arcsColorList[countArcs-1]; // colorful = arcsColor[i-1];

          // print("arcsCount:");
          // print(arcsColorList.length);
          final paint2 = Paint()
            ..color = arcsDefinedColor
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..strokeCap = StrokeCap.butt;

          Rect rectangle2 = Rect.fromCircle(
              center: circleCenter,
              radius: circleRadius - (strokeWidth * (8 - (i - 1))));
          final path2 = Path()..addArc(rectangle2, startAngle, sweepAngle);
          canvas.drawPath(path2, paint2);
          // Rect rectangle0 =
          //   Rect.fromCircle(center: circleCenter, radius: (circleRadius/2 + paint0.strokeWidth)); //  // radius: (circleRadius/2 + paint0.strokeWidth)
          // canvas.drawPath(path2, paint0);
          Rect rectangle0 = Rect.fromCircle(
              center: circleCenter,
              radius: circleRadius - (strokeWidth * (8 - (i - 0.5))));
          canvas.drawArc(rectangle0, startAngle, sweepAngle, useCenter, paint0);
        }

        // useCenter = false;
        // canvas.drawArc(rectangle2, startAngle, sweepAngle, useCenter, paint2);
      }
    }

    return canvas;
  }
}
