import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPositionedTwoScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AnimatedPositionedTwoScreen> {
  bool isClick = false;
  double rating = 0.0;

  Widget _buildAnimatedPositionedHeart(final double rating, final double fromLeft, final double toLeft) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: isClick ? -50 : MediaQuery.of(context).size.height * 0.70 - 25,
      left: isClick ? toLeft : fromLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(rating.toStringAsFixed(2)),
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 50,
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _widgetsWidth = MediaQuery.of(context).size.width * 0.70;

    return Scaffold(
      body: Stack(
        children: [
          _buildAnimatedPositionedHeart(min(1, max(0, rating - 0)), MediaQuery.of(context).size.width * 0.20 - 25, MediaQuery.of(context).size.width * -0.10 - 25),
          _buildAnimatedPositionedHeart(min(1, max(0, rating - 1)), MediaQuery.of(context).size.width * 0.35 - 25, MediaQuery.of(context).size.width * 0.20 - 25),
          _buildAnimatedPositionedHeart(min(1, max(0, rating - 2)), MediaQuery.of(context).size.width * 0.50 - 25, MediaQuery.of(context).size.width * 0.50 - 25),
          _buildAnimatedPositionedHeart(min(1, max(0, rating - 3)), MediaQuery.of(context).size.width * 0.65 - 25, MediaQuery.of(context).size.width * 0.80 - 25),
          _buildAnimatedPositionedHeart(min(1, max(0, rating - 4)), MediaQuery.of(context).size.width * 0.80 - 25, MediaQuery.of(context).size.width * 1.10 - 25),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.70 - 50,
            left: MediaQuery.of(context).size.width * 0.15,
            height: 100,
            width: _widgetsWidth * 0.70,
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                setState(() {
                  isClick = true;
                });
              },
              onHorizontalDragUpdate: (details) {
                setState(() {
                  rating = details.localPosition.dx/_widgetsWidth * 5;
                });
                print(details.localPosition.dx/_widgetsWidth * 5);
              },
            )
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isClick = false;
          });
        },
        backgroundColor: Colors.grey,
        child: Icon(Icons.refresh),
        tooltip: "refresh",
      ),
    );
  }
}
