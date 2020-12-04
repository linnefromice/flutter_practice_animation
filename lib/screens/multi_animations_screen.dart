import 'package:flutter/material.dart';
import 'package:flutter_practice_animation/components/rated_heart.dart';
import 'package:flutter_practice_animation/components/wrapper_common_background.dart';

class MultiAnimationsScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MultiAnimationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapperCommonBackground(
        child: Center(
          child: RatedHeart(
            size: 50,
            rate: 1.0,
          ),
        )
      ),
    );
  }
}