import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/chart'),
            child: Container(
              height: 50,
              color: Colors.amber[900],
              child: Center(child: Text('Chart')),
            ),
          ),
        ],
      ),
    );
  }
}