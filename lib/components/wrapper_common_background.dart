import 'package:flutter/material.dart';

class WrapperCommonBackground extends StatelessWidget {
  WrapperCommonBackground({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[300],
              Colors.blue[50],
            ],
          )
      ),
      child: child,
    );
  }
}