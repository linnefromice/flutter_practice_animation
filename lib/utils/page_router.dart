import 'package:flutter/material.dart';
import 'package:flutter_practice_animation/screens/animated_positioned_screen.dart';
import 'package:flutter_practice_animation/screens/animated_positioned_two_screen.dart';
import 'package:flutter_practice_animation/screens/animated_rating_hearts_screen.dart';
import 'package:flutter_practice_animation/screens/animated_rating_hearts_two_screen.dart';
import 'package:flutter_practice_animation/screens/custom_painter_screen.dart';
import 'package:flutter_practice_animation/screens/multi_animations_screen.dart';
import 'package:flutter_practice_animation/screens/page_controller_screen.dart';
import 'package:flutter_practice_animation/screens/physics_simulation_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_practice_animation/screens/align_transition_screen.dart';
import 'package:flutter_practice_animation/screens/wave_screen.dart';
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
      case '/wave':
        return PageTransition(
            child: WaveScreen(),
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            settings: settings
        );
        break;
      case '/align_transition':
        return PageTransition(
            child: AlignTransitionScreen(),
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(seconds: 1),
            settings: settings
        );
        break;
      case '/physics_simulation':
        return PageTransition(
            child: PhysicsSimulationScreen(),
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(seconds: 1),
            settings: settings
        );
        break;
      case '/animated_positioned':
        return PageTransition(
            child: AnimatedPositionedScreen(),
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(seconds: 1),
            settings: settings
        );
        break;
      case '/animated_positioned_two':
        return PageTransition(
            child: AnimatedPositionedTwoScreen(),
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(seconds: 1),
            settings: settings
        );
        break;
      case '/multi_animations':
        return PageTransition(
            child: MultiAnimationsScreen(),
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(seconds: 1),
            settings: settings
        );
        break;
      case '/custom_painter':
        return PageTransition(
            child: CustomPainterScreen(),
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(seconds: 1),
            settings: settings
        );
        break;
      case '/animated_rating_hearts':
        return PageTransition(
          child: AnimatedRatingHeartsScreen(),
          type: PageTransitionType.scale,
          alignment: Alignment.bottomCenter,
          duration: Duration(seconds: 1),
          settings: settings
        );
        break;
      case '/animated_rating_hearts_two':
        return PageTransition(
            child: AnimatedRatingHeartsTwoScreen(),
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(seconds: 1),
            settings: settings
        );
        break;
      case '/page_controller':
        return PageTransition(
            child: PageControllerScreen(),
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(seconds: 1),
            settings: settings
        );
        break;
      default:
        return null;
    }
  }
}