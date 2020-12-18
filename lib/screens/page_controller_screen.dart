import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return WrapperCommonBackground(
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              CircleAvatar(child: Text("User 1")),
              CircleAvatar(child: Text("User 2")),
              CircleAvatar(child: Text("User 3")),
              CircleAvatar(child: Text("User 4")),
              CircleAvatar(child: Text("User 5")),
              CircleAvatar(child: Text("User 6")),
            ]
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Icon(Icons.arrow_back),
                    onPressed: () {
                      _pageController.animateToPage(
                        _pageController.page.toInt() - 1,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  RaisedButton(
                    child: Icon(Icons.arrow_forward),
                    onPressed: () {
                      _pageController.animateToPage(
                        _pageController.page.toInt() + 1,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}