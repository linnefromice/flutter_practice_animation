import 'package:flutter/material.dart';
import 'package:flutter_practice_animation/components/rated_heart.dart';
import 'package:flutter_practice_animation/components/wrapper_common_background.dart';

class MultiAnimationsScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MultiAnimationsScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _sizeAnimation;
  Animation<Color> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100)
    );
    _sizeAnimation = Tween<double>(
      begin: 50,
      end: 100
    ).animate(_animationController)..addListener(() {
      setState(() {});
    });
    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.pink
    ).animate(_animationController)..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapperCommonBackground(
        child: Center(
          child: RatedHeart(
            size: _sizeAnimation.value,
            rate: 1.0,
            color: _colorAnimation.value,
          ),
        )
      ),
      floatingActionButton: Column( // 本来非推奨
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'forward',
            child: Icon(Icons.arrow_forward),
            onPressed: () {
              _animationController.forward();
            },
          ),
          FloatingActionButton(
            heroTag: 'back',
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _animationController.reverse();
            },
          ),
        ],
      )
    );
  }
}