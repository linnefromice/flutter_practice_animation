import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:flutter_practice_animation/components/rated_heart.dart';
import 'package:flutter_practice_animation/components/wrapper_common_background.dart';
// import 'package:im_animations/im_animations.dart';

class AnimatedRatingHeartsTwoScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AnimatedRatingHeartsTwoScreen> with SingleTickerProviderStateMixin {
  double _sumRating;
  // bool _wavesDisabled; // <- base color (if use ColorSonar)
  AnimationController _controller;
  SequenceAnimation _sequenceAnimation;
  Path _firstPath;
  Path _secondPath;
  Path _thirdPath;
  Path _fourthPath;
  Path _fifthPath;

  @override
  void initState() {
    super.initState();
    _sumRating = 0.0;
    // _wavesDisabled = true; // <- base color (if use ColorSonar)
    _controller = AnimationController(vsync: this);
    _firstPath = drawFirstPath();
    _secondPath = drawSecondPath();
    _thirdPath = drawThirdPath();
    _fourthPath = drawFourthPath();
    _fifthPath = drawFifthPath();
    _sequenceAnimation = SequenceAnimationBuilder()
      .addAnimatable(
        animatable: Tween<double>(begin: 0.0, end: 1.0),
        from: Duration(milliseconds: 0),
        to: Duration(milliseconds: 3000),
        curve: Curves.bounceIn,
        tag: 'move_heart'
      )
      .addAnimatable(
        animatable: Tween<double>(begin: 50, end: 60),
        from: Duration(milliseconds: 0),
        to: Duration(milliseconds: 3000),
        curve: Curves.easeInOutSine,
        tag: 'heart_beat'
      )
      .addAnimatable(
        animatable: ColorTween(begin: Colors.white, end: Colors.pink[50]),
        from: Duration(milliseconds: 3000),
        to: Duration(milliseconds: 4000),
        tag: 'from_avatar_circle_color'
      )
      .addAnimatable(
        animatable: ColorTween(begin: Colors.blue[100], end: Colors.pink[200]),
        from: Duration(milliseconds: 3000),
        to: Duration(milliseconds: 4000),
        tag: 'to_avatar_circle_color'
      ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Path drawFirstPath() {
    Size size = Size(300,300);
    Path path = Path();
    path.quadraticBezierTo( -size.width * 0.6, -size.height * 0.5, 100, -size.height);
    return path;
  }

  Path drawSecondPath() {
    Size size = Size(300,300);
    Path path = Path();
    path.quadraticBezierTo( -size.width * 0.4, -size.height * 0.5, 50, -size.height);
    return path;
  }

  Path drawThirdPath() {
    Size size = Size(300,300);
    Path path = Path();
    path.quadraticBezierTo( 0, -size.height * 0.5, 0, -size.height);
    return path;
  }

  Path drawFourthPath() {
    Size size = Size(300,300);
    Path path = Path();
    path.quadraticBezierTo( size.width * 0.4, -size.height * 0.5, -50, -size.height);
    return path;
  }

  Path drawFifthPath() {
    Size size = Size(300,300);
    Path path = Path();
    path.quadraticBezierTo( size.width * 0.6, -size.height * 0.5, -100, -size.height);
    return path;
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  Offset calculate(value, path) {
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent pos = pathMetric.getTangentForOffset(value);
    return pos.position;
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
    final paths = [_firstPath, _secondPath, _thirdPath, _fourthPath, _fifthPath];
    return List.generate(count, (index) =>
      _buildPositionedHeart(
        min(1, max(0, sumRating - index)),
        iconSize,
        baseTop - iconSize * 0.50 + calculate(_sequenceAnimation['move_heart'].value, paths[index]).dy, // base top & icon size & animation
        MediaQuery.of(context).size.width * leftWeightingFactors[index] - iconSize * 0.50 + calculate(_sequenceAnimation['move_heart'].value, paths[index]).dx, // base top & icon size & animation
      )
    );
  }

  Widget _buildGestureDetectorWidget(final double wrappedWidgetWidth) {
    return GestureDetector(
      onVerticalDragEnd: (details) async {
        _playAnimation();
        await Future.delayed(Duration(milliseconds: 3000));
        // if use ColorSonar
//        setState(() {
//          _wavesDisabled = false;
//        });
      },
      onHorizontalDragUpdate: (details) {
        double sumRating = details.localPosition.dx/wrappedWidgetWidth * 5;
        if (sumRating > 5) sumRating = 5;
        if (sumRating < 0) sumRating = 0;
        setState(() {
          _sumRating = sumRating;
        });
      },
    );
  }

  Widget _buildAvatarArea() => Container(
    height: MediaQuery.of(context).size.width * 0.40,
    width: MediaQuery.of(context).size.width * 0.40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          _sequenceAnimation['from_avatar_circle_color'].value,
          _sequenceAnimation['to_avatar_circle_color'].value
          // Colors.blue[100], <- base color (if use ColorSonar)
        ],
      )
    ),
    child: FractionallySizedBox(
      alignment: Alignment.topCenter,
      widthFactor: 0.6,
      child: CircleAvatar(
        maxRadius: 30,
      )
    ),
  );

  List<Widget> _buildChildren(BuildContext context) {
    final double _heartIconSize = 50;
    final double _baseTop = MediaQuery.of(context).size.height * 0.70;
    final double _widgetsWidth = MediaQuery.of(context).size.width * 0.70;

    List<Widget> _children = _createRatingHearts(
      baseTop: _baseTop,
      iconSize: _sequenceAnimation['heart_beat'].value,
      sumRating: _sumRating
    );
    _children.add(Positioned(
      top: MediaQuery.of(context).size.height * 0.30,
      left: MediaQuery.of(context).size.width * 0.30,
      child: _buildAvatarArea()
//      child: ColorSonar(
//        contentAreaRadius: 80,
//        waveMotionEffect: Curves.easeInOut,
//        wavesDisabled: _wavesDisabled,
//        innerWaveColor: Colors.blue[100],
//        middleWaveColor: Colors.blue[50],
//        outerWaveColor: Colors.white,
//        child: _buildAvatarArea(),
//      ),
    ));
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
    return _children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapperCommonBackground(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context,child) {
            return Stack(
              children: _buildChildren(context),
            );
          },
        )
      )
    );
  }
}
