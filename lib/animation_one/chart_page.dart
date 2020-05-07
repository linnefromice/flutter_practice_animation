import 'dart:math';

import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ChartPage> {
  final random = Random();
  int dataSet;

  @override
  void initState() {
    super.initState();
    dataSet = 50;
  }

  void changeData() {
    setState(() {
      dataSet = random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(200.0, 100.0),
          painter: BarChartPainter(dataSet.toDouble()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  static double barWidth = 10.0;

  BarChartPainter(this.barHeight);
  final double barHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
        ..color = Colors.blue[400]
        ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromLTWH(
        (size.width - barWidth) / 2.0,
        size.height - barHeight,
        barWidth,
        barHeight
      ),
      paint
    );
  }

  @override
  bool shouldRepaint(BarChartPainter old) => barHeight != old.barHeight;
}