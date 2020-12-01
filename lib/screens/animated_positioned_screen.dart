import 'package:flutter/material.dart';

class AnimatedPositionedScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AnimatedPositionedScreen> {
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: isClick ? -10 : MediaQuery.of(context).size.height * 0.70 - 25,
            left: MediaQuery.of(context).size.width * 0.5 - 25,
            child: Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 50,
            ),
          )
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