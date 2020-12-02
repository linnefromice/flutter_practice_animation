import 'package:flutter/material.dart';

class AnimatedPositionedTwoScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AnimatedPositionedTwoScreen> {
  bool isClick = false;

  Widget _buildAnimatedPositionedHeart(final double fromLeft, final double toLeft) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: isClick ? -50 : MediaQuery.of(context).size.height * 0.70 - 25,
      left: isClick ? toLeft : fromLeft,
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
          _buildAnimatedPositionedHeart(MediaQuery.of(context).size.width * 0.20 - 25, MediaQuery.of(context).size.width * -0.10 - 25),
          _buildAnimatedPositionedHeart(MediaQuery.of(context).size.width * 0.35 - 25, MediaQuery.of(context).size.width * 0.20 - 25),
          _buildAnimatedPositionedHeart(MediaQuery.of(context).size.width * 0.50 - 25, MediaQuery.of(context).size.width * 0.50 - 25),
          _buildAnimatedPositionedHeart(MediaQuery.of(context).size.width * 0.65 - 25, MediaQuery.of(context).size.width * 0.80 - 25),
          _buildAnimatedPositionedHeart(MediaQuery.of(context).size.width * 0.80 - 25, MediaQuery.of(context).size.width * 1.10 - 25),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isClick = true;
          });
        },
      ),
    );
  }
}
