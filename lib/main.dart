import 'package:flutter/material.dart';
import 'package:flutter_practice_animation/screens/home_screen.dart';
import 'package:flutter_practice_animation/utils/page_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MaterialApp(
      title: 'animation practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      onGenerateRoute: (settings) => PageRouter.generate(settings)
    );
  }
}
