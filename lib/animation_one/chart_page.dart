import 'dart:math';

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

  void handleAdd() {
    setState(() {
      dataSet += 5;
      tween = BarTween(
        tween.evaluate(animation),
        Bar(dataSet.toDouble()),
      );
      animation.forward(from: 0.0);
    });
  }

  void handleRemove() {
    setState(() {
      dataSet -= 5;
      tween = BarTween(
        tween.evaluate(animation),
        Bar(dataSet.toDouble()),
      );
      animation.forward(from: 0.0);
    });
  }

  void handleRandomize() {
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
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            label: Text('Random'),
            icon: Icon(Icons.refresh),
            backgroundColor: Colors.grey,
            onPressed: handleRandomize,
          ),
          SizedBox(height: 10),
          FloatingActionButton.extended(
            label: Text('Minus'),
            icon: Icon(Icons.remove),
            backgroundColor: Colors.red,
            onPressed: handleRemove,
          ),
          SizedBox(height: 10),
          FloatingActionButton.extended(
            label: Text('Plus'),
            icon: Icon(Icons.add),
            backgroundColor: Colors.blue,
            onPressed: handleAdd,
          ),
        ],
      )
    );
  }
}
