import 'dart:math';
import 'dart:ui' show lerpDouble;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ChartPage> with TickerProviderStateMixin {
  final random = Random();
  int dataSet;
  AnimationController animation;
  double startHeight;
  double currentHeight;
  double endHeight;

  @override
  void initState() {
    super.initState();
    dataSet = 50;
    animation = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this
    )
    ..addListener(() {
      setState(() {
        currentHeight = lerpDouble(startHeight, endHeight, animation.value);
      });
    });
    startHeight = 0.0;
    currentHeight = 0.0;
    endHeight = dataSet.toDouble();
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      startHeight = currentHeight;
      dataSet = random.nextInt(100);
      endHeight = dataSet.toDouble();
      animation.forward(from: 0.0);
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