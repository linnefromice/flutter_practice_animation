import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_practice_animation/components/rated_heart.dart';

class AnimatedPositionedTwoScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AnimatedPositionedTwoScreen> {
  bool isClick = false;
  double rating = 0.0;

  Widget _buildAnimatedPositionedHeart(final double rating, final double fromLeft, final double toLeft) {
    final double _iconSize = 50;
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: isClick ? - _iconSize : MediaQuery.of(context).size.height * 0.70 - _iconSize * 0.50,
      left: isClick ? toLeft - _iconSize * 0.50 : fromLeft - _iconSize * 0.50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(rating.toStringAsFixed(2)),
          RatedHeart(
            rate: rating,
            size: _iconSize,
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
          _buildAnimatedPositionedHeart(min(1, max(0, rating - 0)), MediaQuery.of(context).size.width * 0.20, MediaQuery.of(context).size.width * -0.10),
          _buildAnimatedPositionedHeart(min(1, max(0, rating - 1)), MediaQuery.of(context).size.width * 0.35, MediaQuery.of(context).size.width * 0.20),
          _buildAnimatedPositionedHeart(min(1, max(0, rating - 2)), MediaQuery.of(context).size.width * 0.50, MediaQuery.of(context).size.width * 0.50),
          _buildAnimatedPositionedHeart(min(1, max(0, rating - 3)), MediaQuery.of(context).size.width * 0.65, MediaQuery.of(context).size.width * 0.80),
          _buildAnimatedPositionedHeart(min(1, max(0, rating - 4)), MediaQuery.of(context).size.width * 0.80, MediaQuery.of(context).size.width * 1.10),
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
