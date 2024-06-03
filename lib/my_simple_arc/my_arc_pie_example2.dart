import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const ArcPieComboChart());

class ArcPieComboChart extends StatelessWidget {
  const ArcPieComboChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Arc Pie Chart Example",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomPaint(
                  size: const Size(750, 750),
                  painter: ArcPieComboPainter(),
                ),
              ],
            ),
          )),
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

    // Quinn results 2 implement as pie arc chart:
    // * '4 equal QuarterParts' of a Circle or Pie Chart
    // * each QuarterPart contains '4 arcs' & '8 rays'
    // * (QuarterPartIndex, QuarterPartName, ArcsFilled)
    // * ArcsFilled =
    // (QuarterPartIndex=0, ())

    // 8 raysPie_StartRight2CenterBottom:

    // ray1_8 = (quarterPart_Half / (2 * 2));
    List<double> raysPieR2CB = [
      ((quarterPart_Half / (2 * 1)) * 0) + ((quarterPart_Half / (2 * 2)) * 0),
      // pi * 2 + (quarterPart_Half / (2 * 3)),

      ((quarterPart_Half / (2 * 1)) * 0) + ((quarterPart_Half / (2 * 2)) * 1),
      // pi * 2 + (quarterPart_Half / (2 * 1)),

      ((quarterPart_Half / (2 * 1)) * 1) + ((quarterPart_Half / (2 * 2)) * 0),
      // pi * 2 + (quarterPart_Half / (2 * 1)) + (quarterPart_Half / (2 * 2)),

      ((quarterPart_Half / (2 * 1)) * 1) + ((quarterPart_Half / (2 * 2)) * 1),
      // pi * 2 +
      //     (quarterPart_Half / (2 * 1)) +
      //     (quarterPart_Half / (2 * 2)) +
      //     (quarterPart_Half / (2 * 2)),

      ((quarterPart_Half / (2 * 1)) * 1) + ((quarterPart_Half / (2 * 2)) * 2),
      // pi * 2 +
      //     (quarterPart_Half / 2) +
      //     (quarterPart_Half / 4) +
      //     (quarterPart_Half / 4) +
      //     (quarterPart_Half / 4),

      ((quarterPart_Half / (2 * 1)) * 1) + ((quarterPart_Half / (2 * 2)) * 3),
      // pi * 2 +
      //     (quarterPart_Half / 2) +
      //     (quarterPart_Half / 4) +
      //     (quarterPart_Half / 4) +
      //     (quarterPart_Half / 4) +
      //     (quarterPart_Half / 4),

      ((quarterPart_Half / (2 * 1)) * 1) + ((quarterPart_Half / (2 * 2)) * 4),
      // pi * 2 +
      //     (quarterPart_Half / 2) +
      //     (quarterPart_Half / 4) +
      //     (quarterPart_Half / 4) +
      //     (quarterPart_Half / 4) +
      //     (quarterPart_Half / 4),

      ((quarterPart_Half / (2 * 1)) * 1) + ((quarterPart_Half / (2 * 2)) * 5),
    ];

    // //(0: 0 & 0, 1: 0 & 1, 2: 1 & 0, 3: 1 & 1, 4: 1 & 2, 5: 1 & 3, 6: 1 & 4, 7: 1 & 5)
    // // List<Map<int, int>> index = [ (0, 0), (0, 1), (1, 0), (1, 1, 12, 13, 14, 15, 16)

    // List<Map<String, int?>> indexes = [];
    // for (int c = 0, i = 0, j = 0; c < 8; c++) {
    //   if (c == 0) {
    //     i = 0;
    //     j = 0;
    //   } else if (c == 1) {
    //     i = 0;
    //     j = 1;
    //   } else if (c == 2) {
    //     i = 1;
    //     j = 0;
    //   } else {
    //     i = 1;
    //     j++;
    //   }
    //   // print("i:" + i.toString() + "j:" + j.toString());
    //   indexes.add({'index1': i, 'index2': j});
    //   // print(indexes);
    //   print(
    //       "indexes[$c]['i'] = ${indexes[c]['index1']} & indexes[$c]['j'] = ${indexes[c]['index2']}");
    // }
    // //   {0: 0, 0 : 1},
    // // ];
    // List<double> raysPieR2CB2 = [];
    // double ray = pi * 2;
    // for (int c = 0; c < 8; c++) {
    //   // if (ray <=
    //   //     (pi * 2) +
    //   //         ((quarterPart_Half / (2 * 1)) * 1) +
    //   //         ((quarterPart_Half / (2 * 2)) * 5)) {
    //   ray += (pi * 2) +
    //       ((quarterPart_Half / (2 * 1)) * indexes[c]['index1']!) +
    //       ((quarterPart_Half / (2 * 2)) * indexes[c]['index2']!);
    //   print("***");
    //   // }
    //   raysPieR2CB2.add(ray);

    //   // calc = (index % 2) * index;
    //   print(
    //       "rays[$c] = $ray == ${raysPieR2CB2[c]} == ${raysPieR2CB[c]} with indexes");
    // }

    // //show paper on background:
    // final paint = Paint()
    //   ..color = Colors.black12
    //   ..style = PaintingStyle.fill
    //   ..strokeWidth = 1.5
    //   ..strokeCap = StrokeCap.butt;
    // canvas.drawRect(const Rect.fromLTRB(0, 0, 1500, 750), paint);

    //Part 1 of 4:
    paintPieArcsSection(canvas, size, Colors.green, 4,
        (pi * 1) + raysPieR2CB[0], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.green, 3,
        (pi * 1) + raysPieR2CB[1], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.green, 3,
        (pi * 1) + raysPieR2CB[2], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.green, 2,
        (pi * 1) + raysPieR2CB[3], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.green, 3,
        (pi * 1) + raysPieR2CB[4], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.green, 3,
        (pi * 1) + raysPieR2CB[5], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.green, 4,
        (pi * 1) + raysPieR2CB[6], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.green, 3,
        (pi * 1) + raysPieR2CB[7], quarterPart_Half / 4);

    //Part 2 of 4:
    paintPieArcsSection(canvas, size, Colors.orange, 4,
        (pi * 1.5) + raysPieR2CB[0], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.orange, 4,
        (pi * 1.5) + raysPieR2CB[1], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.orange, 3,
        (pi * 1.5) + raysPieR2CB[2], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.orange, 3,
        (pi * 1.5) + raysPieR2CB[3], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.orange, 3,
        (pi * 1.5) + raysPieR2CB[4], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.orange, 4,
        (pi * 1.5) + raysPieR2CB[5], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.orange, 3,
        (pi * 1.5) + raysPieR2CB[6], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.orange, 3,
        (pi * 1.5) + raysPieR2CB[7], quarterPart_Half / 4);

    //Part 3 of 4:
    paintPieArcsSection(canvas, size, Colors.pink, 4, (pi * 2) + raysPieR2CB[0],
        quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.pink, 3, (pi * 2) + raysPieR2CB[1],
        quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.pink, 3, (pi * 2) + raysPieR2CB[2],
        quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.pink, 3, (pi * 2) + raysPieR2CB[3],
        quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.pink, 2, (pi * 2) + raysPieR2CB[4],
        quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.pink, 3, (pi * 2) + raysPieR2CB[5],
        quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.pink, 2, (pi * 2) + raysPieR2CB[6],
        quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.pink, 4, (pi * 2) + raysPieR2CB[7],
        quarterPart_Half / 4);

    //Part 4 of 4:
    paintPieArcsSection(canvas, size, Colors.blue, 3,
        (pi * 2.5) + raysPieR2CB[0], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.blue, 2,
        (pi * 2.5) + raysPieR2CB[1], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.blue, 3,
        (pi * 2.5) + raysPieR2CB[2], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.blue, 2,
        (pi * 2.5) + raysPieR2CB[3], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.blue, 2,
        (pi * 2.5) + raysPieR2CB[4], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.blue, 3,
        (pi * 2.5) + raysPieR2CB[5], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.blue, 3,
        (pi * 2.5) + raysPieR2CB[6], quarterPart_Half / 4);
    paintPieArcsSection(canvas, size, Colors.blue, 4,
        (pi * 2.5) + raysPieR2CB[7], quarterPart_Half / 4);

    paintText(canvas, size, "Mensgericht", Colors.green, 1);
    paintText(canvas, size, "Innovatiegericht", Colors.orange, 2);
    paintText(canvas, size, "Resultaatsgericht", Colors.pink, 3);
    paintText(canvas, size, "Beheersgericht", Colors.blue, 4);
//     // part 1 of 4 [left to top => 90° clockwise] :
//     paintPieArcsSection(canvas, size, Colors.yellow, 5, pi, quarterPart_Full);

//     // part 2 of 4 [top to right => 90° clockwise] :
//     paintPieArcsSection(
//         canvas, size, Colors.orange, 4, pi * 1.5, quarterPart_Half);
//     paintPieArcsSection(canvas, size, Colors.orange, 4,
//         (pi * 1.5) + (quarterPart_Half), quarterPart_Half);

//     // part 3 of 4 [left to top => 90° clockwise] :
//     paintPieArcsSection(
//         canvas, size, Colors.green, 1, pi * 2, quarterPart_Half / 2);
//     paintPieArcsSection(canvas, size, Colors.purple, 2,
//         pi * 2 + (quarterPart_Half / 2), quarterPart_Half / 2);
//     paintPieArcsSection(canvas, size, Colors.pink, 3,
//         pi * 2 + (quarterPart_Half), quarterPart_Half / 2);
//     paintPieArcsSection(
//         canvas,
//         size,
//         Colors.deepOrange,
//         4,
//         pi * 2 + (quarterPart_Half) + (quarterPart_Half / 2),
//         quarterPart_Half / 2);

//     // part 4 of 4 [top to right => 90° clockwise] :
//     paintPieArcsSection(
//         canvas, size, Colors.blue, 3, pi * 2.5, quarterPart_Full / 3);
//     paintPieArcsSection(canvas, size, Colors.blue, 2,
//         pi * 2.5 + (quarterPart_Full / 3), quarterPart_Full / 3);
//     paintPieArcsSection(canvas, size, Colors.blue, 2,
//         pi * 2.5 + (2 * (quarterPart_Full / 3)), quarterPart_Full / 3);
// //    paintPieArcsSection(canvas, size, Colors.blue, 2, pi*2.5, (1 * pi) / 2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Canvas paintText(
    Canvas canvas,
    Size size,
    String text,
    Color backgroundColor,
    int pieSection,
  ) {
    TextStyle textStyle = TextStyle(
        color: Colors.black,
        fontSize: 30,
        backgroundColor: backgroundColor,
        fontWeight: FontWeight.w600);
    TextSpan textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    double xOffsetValue = 0;
    double yOffsetValue = 0;
    switch (pieSection) {
      case 1:
        xOffsetValue = 450;
        yOffsetValue = size.height / 4;
        break;
      case 2:
        xOffsetValue = -450;
        yOffsetValue = size.height / 4;
        break;
      case 3:
        xOffsetValue = -450;
        yOffsetValue = -(size.height / 4);
        break;
      case 4:
        xOffsetValue = 450;
        yOffsetValue = -(size.height / 4);
        break;
      default:
        xOffsetValue = 450;
        yOffsetValue = size.height / 4;
        break;
    }
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = ((size.width - textPainter.width) / 2);
    final yCenter = ((size.height - textPainter.height) / 2);
    final offset = Offset(xCenter - xOffsetValue, yCenter - yOffsetValue);
    textPainter.paint(canvas, offset);

    return canvas;
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
    // print(countArcs);
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
        ..color = Colors.black12
        ..style = PaintingStyle.fill
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
