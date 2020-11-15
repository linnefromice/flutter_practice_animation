import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: LiquidSwipe(
        enableSlideIcon: true,
        slideIconWidget: Icon(Icons.subdirectory_arrow_left),
        positionSlideIcon: 0.0,
        // waveType: WaveType.circularReveal,
        pages: [
          Container(
            color: Colors.blue,
            child: Center(child: Text("One")),
          ),
          Container(
            color: Colors.blueGrey,
            child: Center(child: Text("Two")),
          ),
          Container(
            color: Colors.grey,
            child: Center(child: Text("Three")),
          )
        ],
      ),
    );
  }
}