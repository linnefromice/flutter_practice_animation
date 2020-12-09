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
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
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

  List<Widget> _createRatingHearts(double sumRating) {
    final int count = 5;
    final leftWeightingFactors = [0.20, 0.35, 0.50, 0.65, 0.80];
    final double iconSize = 50;
    return List.generate(count, (index) =>
      _buildPositionedHeart(
        min(1, max(0, sumRating - index)),
        iconSize,
        MediaQuery.of(context).size.height * 0.70 - iconSize * 0.50,
        MediaQuery.of(context).size.width * leftWeightingFactors[index] - iconSize * 0.50,
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _children = _createRatingHearts(3);
    return Scaffold(
      body: WrapperCommonBackground(
        child: Stack(
          children: _children,
        ),
      )
    );
  }
}
