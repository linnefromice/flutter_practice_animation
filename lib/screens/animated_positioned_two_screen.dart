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

  List<Widget> _createRatingHearts() {
    final int count = 5;
    final fromLeftWeightingFactors = [0.20, 0.35, 0.50, 0.65, 0.80];
    final toLeftWeightingFactors = [-0.10, 0.20, 0.50, 0.80, 1.10];
    return List.generate(count, (index) =>
        _buildAnimatedPositionedHeart(
            min(1, max(0, rating - index)),
            MediaQuery.of(context).size.width * fromLeftWeightingFactors[index],
            MediaQuery.of(context).size.width * toLeftWeightingFactors[index]
        )
    );
  }

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

  Widget _buildGestureDetectorWidget(final double wrappedWidgetWidth) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        setState(() {
          isClick = true;
        });
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          rating = details.localPosition.dx/wrappedWidgetWidth * 5;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _widgetsWidth = MediaQuery.of(context).size.width * 0.70;
    List<Widget> _children = _createRatingHearts();
    _children.add(Positioned(
      top: MediaQuery.of(context).size.height * 0.70 - 50,
      left: MediaQuery.of(context).size.width * 0.15,
      height: 100,
      width: _widgetsWidth * 0.70,
      child: _buildGestureDetectorWidget(_widgetsWidth)
    ));

    return Scaffold(
      body: Stack(
        children: _children,
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
