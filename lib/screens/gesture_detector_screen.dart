import 'package:flutter/material.dart';

class GestureDetectorScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<GestureDetectorScreen> {
  double _positionXStart = 20;
  double _positionYStart = 20;
  double _positionXEnd = 380;
  double _positionYEnd = 730;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onVerticalDragStart: (details) {
              print("onVerticalDragStart\nglobalPosition:${details.globalPosition}");
              setState(() {
                _positionXStart = details.localPosition.dx;
                _positionYStart = details.localPosition.dy;
              });
            },
            onVerticalDragUpdate: (details) {
              print("onVerticalDragUpdate\nglobalPosition:${details.globalPosition}\ndelta:${details.delta}");
              setState(() {
                _positionXEnd = details.localPosition.dx;
                _positionYEnd = details.localPosition.dy;
              });
            },
            onVerticalDragEnd: (details) {
              print("onVerticalDragEnd\nvelocity:${details.velocity}");
            },
            onHorizontalDragStart: (details) {
              print("onHorizontalDragStart\nglobalPosition:${details.globalPosition}");
              setState(() {
                _positionXStart = details.globalPosition.dx;
                _positionYStart = details.globalPosition.dy;
              });
            },
            onHorizontalDragUpdate: (details) {
              print("onHorizontalDragUpdate\nglobalPosition:${details.globalPosition}\ndelta:${details.delta}");
              setState(() {
                _positionXEnd = details.globalPosition.dx;
                _positionYEnd = details.globalPosition.dy;
              });
            },
            onHorizontalDragEnd: (details) {
              print("onHorizontalDragEnd\nvelocity:${details.velocity}");
            },
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.8,
                child: Container(
                  color: Colors.grey,
                  child: Center(
                    child: Text("GestureDetector area"),
                  ),
                ),
              ),
            )
          ),
          Positioned(
            left: _positionXStart,
            top: _positionYStart,
            width: 10,
            height: 10,
            child: Container(color: Colors.blue),
          ),
          Positioned(
            left: _positionXEnd,
            top: _positionYEnd,
            width: 10,
            height: 10,
            child: Container(color: Colors.red),
          ),
        ],
      )
    );
  }
}