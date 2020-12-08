import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedRatingHeartsScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AnimatedRatingHeartsScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Path _firstPath;
  Path _secondPath;
  Path _thirdPath;
  Path _fourthPath;
  Path _fifthPath;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    super.initState();
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller)
      ..addListener((){
        setState(() {});
      });
    _firstPath = drawFirstPath();
    _secondPath = drawSecondPath();
    _thirdPath = drawThirdPath();
    _fourthPath = drawFourthPath();
    _fifthPath = drawFifthPath();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset calculate(value, path) {
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent pos = pathMetric.getTangentForOffset(value);
    return pos.position;
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

  Widget _buildAnimatedPositionedHeart(final double top, final double left) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: top,
      left: left,
      child: Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 50,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildAnimatedPositionedHeart(
            MediaQuery.of(context).size.height * 0.70 - 25 + calculate(_animation.value, _firstPath).dy,
            MediaQuery.of(context).size.width * 0.20 - 25 + calculate(_animation.value, _firstPath).dx
          ),
          _buildAnimatedPositionedHeart(
            MediaQuery.of(context).size.height * 0.70 - 25 + calculate(_animation.value, _secondPath).dy,
            MediaQuery.of(context).size.width * 0.35 - 25 + calculate(_animation.value, _secondPath).dx
          ),
          _buildAnimatedPositionedHeart(
            MediaQuery.of(context).size.height * 0.70 - 25 + calculate(_animation.value, _thirdPath).dy,
            MediaQuery.of(context).size.width * 0.50 - 25 + calculate(_animation.value, _thirdPath).dx
          ),
          _buildAnimatedPositionedHeart(
            MediaQuery.of(context).size.height * 0.70 - 25 + calculate(_animation.value, _fourthPath).dy,
            MediaQuery.of(context).size.width * 0.65 - 25 + calculate(_animation.value, _fourthPath).dx
          ),
          _buildAnimatedPositionedHeart(
            MediaQuery.of(context).size.height * 0.70 - 25 + calculate(_animation.value, _fifthPath).dy,
            MediaQuery.of(context).size.width * 0.80 - 25 + calculate(_animation.value, _fifthPath).dx
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.70,
            left: MediaQuery.of(context).size.width * 0.20,
            child: CustomPaint(
              painter: PathPainter(drawFirstPath()),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.70,
            left: MediaQuery.of(context).size.width * 0.35,
            child: CustomPaint(
              painter: PathPainter(drawSecondPath()),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.70,
            left: MediaQuery.of(context).size.width * 0.50,
            child: CustomPaint(
              painter: PathPainter(drawThirdPath()),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.70,
            left: MediaQuery.of(context).size.width * 0.65,
            child: CustomPaint(
              painter: PathPainter(drawFourthPath()),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.70,
            left: MediaQuery.of(context).size.width * 0.80,
            child: CustomPaint(
              painter: PathPainter(drawFifthPath()),
            ),
          ),
          Positioned( // instead of Avatar
            top: MediaQuery.of(context).size.height * 0.30,
            left: MediaQuery.of(context).size.width * 0.50 - 50,
            child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Colors.blue[500],
                      ],
                    )
                )
            )
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }
}

class PathPainter extends CustomPainter {

  Path path;

  PathPainter(this.path);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawPath(this.path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}