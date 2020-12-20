import 'package:flutter/material.dart';
import 'package:flutter_practice_animation/components/avatar_area.dart';
import 'package:flutter_practice_animation/components/wrapper_common_background.dart';

class PageControllerScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<PageControllerScreen> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.5
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
          ],
        ),
      ),
    );
  }
}