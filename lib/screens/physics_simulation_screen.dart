import 'package:flutter/material.dart';
import 'package:flutter_practice_animation/components/wrapper_common_background.dart';

class PhysicsSimulationScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<PhysicsSimulationScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Alignment _dragAlignment = Alignment.bottomCenter;
  Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200) // スピードになっている。アニメーションスピードなので必須項目
    );
    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation() {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.topCenter, // Alignment.topCenter にすると上部に飛ぶ
      ),
    );
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: WrapperCommonBackground(
        child: GestureDetector(
          onPanDown: (details) {
            _controller.stop();
          },
          onPanUpdate: (details) {
            setState(() {
              _dragAlignment += Alignment(
                details.delta.dx / (size.width / 2),
                details.delta.dy / (size.height / 2),
              );
            });
          },
          onPanEnd: (details) {
            _runAnimation();
          },
          child: Align(
              alignment: _dragAlignment,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, color: Colors.pink, size: 40),
                  Icon(Icons.favorite, color: Colors.pink, size: 40),
                  Icon(Icons.favorite, color: Colors.pink, size: 40),
                  Icon(Icons.favorite, color: Colors.pink, size: 40),
                  Icon(Icons.favorite, color: Colors.pink, size: 40),
                ],
              )
          ),
        ),
      )
    );
  }
}