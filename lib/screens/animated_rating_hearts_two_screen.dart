import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_practice_animation/components/rated_heart.dart';
import 'package:flutter_practice_animation/components/wrapper_common_background.dart';
import 'package:im_animations/im_animations.dart';

class AnimatedRatingHeartsTwoScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AnimatedRatingHeartsTwoScreen> with SingleTickerProviderStateMixin {
  double _sumRating;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _sumRating = 0.0;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    )..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPositionedHeart(final double rating, final double iconSize, final double top, final double left) {
    return Positioned(
      top: top,
      left: left,
      child: RatedHeart(
        rate: rating,
        size: iconSize,
      ),
    );
  }

  List<Widget> _createRatingHearts({final double baseTop, final double iconSize, final double sumRating}) {
    final int count = 5;
    final leftWeightingFactors = [0.20, 0.35, 0.50, 0.65, 0.80];
    return List.generate(count, (index) =>
      _buildPositionedHeart(
        min(1, max(0, sumRating - index)),
        iconSize,
        baseTop - iconSize * 0.50,
        MediaQuery.of(context).size.width * leftWeightingFactors[index] - iconSize * 0.50,
      )
    );
  }

  Widget _buildGestureDetectorWidget(final double wrappedWidgetWidth) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        // TODO: start animation
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          _sumRating = details.localPosition.dx/wrappedWidgetWidth * 5;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _heartIconSize = 50;
    final double _baseTop = MediaQuery.of(context).size.height * 0.70;
    final double _widgetsWidth = MediaQuery.of(context).size.width * 0.70;

    List<Widget> _children = _createRatingHearts(
      baseTop: _baseTop,
      iconSize: _heartIconSize,
      sumRating: _sumRating
    );
    _children.add(Positioned(
      top: _baseTop - _heartIconSize,
      left: MediaQuery.of(context).size.width * 0.15,
      height: 100,
      width: _widgetsWidth * 0.70,
      child: _buildGestureDetectorWidget(_widgetsWidth)
    ));
    _children.add(Positioned(
      top: _baseTop - _heartIconSize,
      left: MediaQuery.of(context).size.width * 0.5 - 10,
      child: Text(_sumRating.toStringAsPrecision(2))
    ));

    return Scaffold(
      body: WrapperCommonBackground(
        child: Stack(
          children: _children,
        ),
      )
    );
  }
}
