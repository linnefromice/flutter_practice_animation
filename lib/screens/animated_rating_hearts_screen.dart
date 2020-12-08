import 'package:flutter/material.dart';

class AnimatedRatingHeartsScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AnimatedRatingHeartsScreen> {
  Widget _buildAnimatedPositionedHeart(final double fromLeft, final double toLeft) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: MediaQuery.of(context).size.height * 0.70 - 25,
      left: fromLeft,
      child: Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 50,
      ),
    );
  }

  Path drawFirstPath() {
    Size size = Size(300,300);
    Path path = Path();
    path.quadraticBezierTo( -size.width * 0.6, -size.height * 0.5, 0, -size.height);
    return path;
  }

  Path drawSecondPath() {
    Size size = Size(300,300);
    Path path = Path();
    path.quadraticBezierTo( -size.width * 0.4, -size.height * 0.5, 0, -size.height);
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
    path.quadraticBezierTo( size.width * 0.4, -size.height * 0.5, 0, -size.height);
    return path;
  }

  Path drawFifthPath() {
    Size size = Size(300,300);
    Path path = Path();
    path.quadraticBezierTo( size.width * 0.6, -size.height * 0.5, 0, -size.height);
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildAnimatedPositionedHeart(MediaQuery.of(context).size.width * 0.20 - 25, MediaQuery.of(context).size.width * -0.10 - 25),
          _buildAnimatedPositionedHeart(MediaQuery.of(context).size.width * 0.35 - 25, MediaQuery.of(context).size.width * 0.20 - 25),
          _buildAnimatedPositionedHeart(MediaQuery.of(context).size.width * 0.50 - 25, MediaQuery.of(context).size.width * 0.50 - 25),
          _buildAnimatedPositionedHeart(MediaQuery.of(context).size.width * 0.65 - 25, MediaQuery.of(context).size.width * 0.80 - 25),
          _buildAnimatedPositionedHeart(MediaQuery.of(context).size.width * 0.80 - 25, MediaQuery.of(context).size.width * 1.10 - 25),
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
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // isClick = true;
          });
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