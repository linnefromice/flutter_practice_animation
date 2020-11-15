import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_practice_animation/screens/chart_page.dart';
import 'package:flutter_practice_animation/screens/flick_screen.dart';
import 'package:flutter_practice_animation/screens/gesture_detector_screen.dart';
import 'package:flutter_practice_animation/screens/gesture_detector_two_screen.dart';
import 'package:flutter_practice_animation/screens/home_screen.dart';
import 'package:flutter_practice_animation/screens/liquid_swipe_screen.dart';

mixin PageRouter implements StatelessWidget {
  static Route generate (RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageTransition(
            child: HomeScreen(),
            type: PageTransitionType.size,
            settings: settings
        );
        break;
      case '/chart':
        return PageTransition(
            child: ChartPage(),
            type: PageTransitionType.rotate,
            settings: settings
        );
        break;
      case '/liquid_swipe':
        return PageTransition(
            child: LiquidSwipeScreen(),
            type: PageTransitionType.rightToLeftWithFade,
            settings: settings
        );
        break;
      case '/flick':
        return PageTransition(
            child: FlickScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: settings
        );
        break;
      case '/gesture_detector':
        return PageTransition(
            child: GestureDetectorScreen(),
            type: PageTransitionType.fade,
            settings: settings
        );
        break;
      case '/gesture_detector_two':
        return PageTransition(
            child: GestureDetectorTwoScreen(),
            type: PageTransitionType.fade,
            duration: Duration(seconds: 1),
            settings: settings
        );
        break;
      default:
        return null;
    }
  }
}