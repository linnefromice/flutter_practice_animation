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

  Widget _createSlideButton(final Icon icon, final int nextPage) => RaisedButton(
    child: icon,
    onPressed: () {
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  );

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
                  _createSlideButton(
                    Icon(Icons.arrow_back),
                    _pageController.page.toInt() - 1
                  ),
                  _createSlideButton(
                    Icon(Icons.arrow_forward),
                    _pageController.page.toInt() + 1
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}