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
  Tween<double> tween;

  @override
  void initState() {
    super.initState();
    dataSet = 50;
    animation = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this
    );
    tween = Tween<double>(begin: 0.0, end: dataSet.toDouble());
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      dataSet = random.nextInt(100);
      tween = Tween<double>(
        begin: tween.evaluate(animation),
        end: dataSet.toDouble(),
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(200.0, 100.0),
          painter: BarChartPainter(tween.animate(animation)),
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

  BarChartPainter(this.animation) : super(repaint: animation);
  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final barHeight = animation.value;
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
  bool shouldRepaint(BarChartPainter old) => false;
}