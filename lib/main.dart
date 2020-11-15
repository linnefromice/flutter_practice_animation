import 'package:flutter/material.dart';
import 'package:flutter_practice_animation/screens/chart_page.dart';
import 'package:flutter_practice_animation/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/chart': (context) => ChartPage()
      },
    );
  }
}
