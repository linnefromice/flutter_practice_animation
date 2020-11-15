import 'package:flutter/material.dart';

class AlignTransitionScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AlignTransitionScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _isTopLeft;
  Animation<Alignment> _alignment;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this
    );
    _isTopLeft = true;
    _alignment = _animationController.drive(
        AlignmentTween(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlignTransition(
        alignment: _alignment,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _isTopLeft ? _animationController.forward() : _animationController.reverse();
          _isTopLeft = !_isTopLeft;
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}