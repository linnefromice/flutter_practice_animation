import 'package:flutter/material.dart';

class CustomPainterScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CustomPainterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Text("CustomPainterScreen"),
      ),
    );
  }
}