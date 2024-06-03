import 'package:flutter/material.dart';

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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Non-border heart
          CustomPaint(
            size: const Size(280, 260),
            painter: MyCustomPainter(),
          ),
        ],
      )),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // canvas.save();
    // canvas.clipRRect(RRect.fromRectXY(rect, 100.0, 100.0));
    
    // Original starting here:
    // var layer = canvas.createLayer(Offset.zero & size);

    // Save the current layer
    // Create a new layer
    canvas.saveLayer(Offset.zero & size, Paint());

    // Draw on the saved layer
    canvas.drawRect(const Rect.fromLTRB(50, 50, 200, 200), Paint()..color = Colors.amber);

    // Restore the saved layer
    canvas.restore();

    // Draw on the original canvas
    canvas.drawCircle(const Offset(100, 100), 50, Paint()..color = Colors.blueGrey);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) => false;
}