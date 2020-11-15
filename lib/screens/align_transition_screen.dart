import 'package:flutter/material.dart';

class AlignTransitionScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AlignTransitionScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _isTopLeft;
  Animation<Alignment> _alignmentTopLeft;
  Animation<Alignment> _alignmentBottomRight;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this
    );
    _isTopLeft = true;
    _alignmentTopLeft = _animationController.drive(
        AlignmentTween(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
    );
    _alignmentBottomRight = _animationController.drive(
        AlignmentTween(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft
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
        alignment: _isTopLeft ? _alignmentBottomRight : _alignmentTopLeft,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.forward();
          setState(() {
            _isTopLeft = !_isTopLeft;
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}