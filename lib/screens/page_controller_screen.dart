import 'package:flutter/material.dart';
import 'package:flutter_practice_animation/components/avatar_area.dart';
import 'package:flutter_practice_animation/components/wrapper_common_background.dart';

class PageControllerScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<PageControllerScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _opacity;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );
    _opacity = _animationController.drive(Tween<double>(
      begin: 1,
      end: 0
    ));
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.5
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildIconsArea() => Stack(
    children: [
      Center(
        child: Icon(
          Icons.circle,
          size: 75,
          color: Colors.white,
        ),
      ),
      Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Icon(
            Icons.forward,
            size: 75,
            color: Colors.blue[100],
          )
        )
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WrapperCommonBackground(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                AvatarArea(
                  diameter: MediaQuery.of(context).size.width,
                  child: Text("User 1"),
                  image: null,
                ),
                AvatarArea(
                  diameter: MediaQuery.of(context).size.width,
                  child: Text("User 2"),
                  image: null,
                ),
                AvatarArea(
                  diameter: MediaQuery.of(context).size.width,
                  child: Text("User 3"),
                  image: null,
                ),
              ]
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    minWidth: 50,
                    height: 50,
                    child: RaisedButton(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      color: Colors.transparent,
                      shape: CircleBorder(),
                      onPressed: () {
                        _pageController.animateToPage(
                          _pageController.page.toInt() - 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    ),
                  ),
                  SizedBox(width: 200),
                  ButtonTheme(
                    minWidth: 50,
                    height: 50,
                    child: RaisedButton(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      color: Colors.transparent,
                      shape: CircleBorder(),
                      onPressed: () {
                        _pageController.animateToPage(
                          _pageController.page.toInt() + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    ),
                  )
                ],
              )
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                child: FadeTransition(
                  opacity: _opacity,
                  child: Column(
                    children: [
                      _buildIconsArea(),
                      Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue[100], // Colors.transparent
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.5
                            )
                        ),
                        child: Center(
                          child: Text(
                            "SWIPE UP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}