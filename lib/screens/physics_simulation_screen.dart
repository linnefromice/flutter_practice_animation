import 'package:flutter/material.dart';

class PhysicsSimulationScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<PhysicsSimulationScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Alignment _dragAlignment = Alignment.center;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onPanDown: (details) {},
        onPanUpdate: (details) {
          setState(() {
            _dragAlignment += Alignment(
              details.delta.dx / (size.width / 2),
              details.delta.dy / (size.height / 2),
            );
          });
        },
        onPanEnd: (details) {},
        child: Align(
          alignment: _dragAlignment,
          child: FlutterLogo()
        ),
      )
    );
  }
}