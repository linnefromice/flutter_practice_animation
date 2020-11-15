import 'dart:math';
import 'dart:ui' show lerpDouble;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'bar.dart';

class ChartPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ChartPage> with TickerProviderStateMixin {
  final random = Random();
  int dataSet;
  AnimationController animation;
  BarTween tween;

  @override
  void initState() {
    super.initState();
    dataSet = 50;
    animation = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this
    );
    tween = BarTween(Bar(0.0), Bar(50.0));
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
      tween = BarTween(
        tween.evaluate(animation),
        Bar(random.nextDouble() * 100.0),
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
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Random'),
        icon: Icon(Icons.refresh),
        backgroundColor: Colors.grey,
        onPressed: changeData,
      ),
    );
  }
}
