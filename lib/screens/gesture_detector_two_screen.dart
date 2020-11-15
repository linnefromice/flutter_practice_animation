import 'package:flutter/material.dart';

class GestureDetectorTwoScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<GestureDetectorTwoScreen> {
  Offset _offset = Offset(10,10);
  Offset _offsetTwo = Offset(300,600);
  double _radians = 0.0;
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetectorTwo'),
      ),
      body: Stack(
        children: <Widget>[
          // Panテスト用のウィジェット
          Positioned(
            left: _offset.dx, // 移動の値（x）
            top: _offset.dy, // 移動の値（y）
            child: GestureDetector(
              // ドラッグの移動を更新
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  _offset = Offset(_offset.dx+details.delta.dx, _offset.dy+details.delta.dy);
                });
              },
              child: Container(
                color: Colors.green,
                width: 100,
                height: 100,
                child: Center(child:Text('Pan\nx:${_offset.dx.toInt()}\ny:${_offset.dy.toInt()}'),),
              ),
            ),
          ),
          // Scale用のウィジェット
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  // 回転とスケールの値を更新
                  onScaleUpdate: (ScaleUpdateDetails details) {
                    setState(() {
                      _radians = details.rotation;
                      _scale = details.scale;
                    });
                  },
                  child: Transform.rotate(
                    angle: _radians, // 回転の値
                    child: Transform.scale(
                      scale: _scale, // スケールの値
                      child: Container(
                        height: 300,
                        width: 300,
                        color: Colors.amber,
                        child: Center(child:Text('rotation:\n$_radians\nscale:\n$_scale'),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: _offsetTwo.dx, // 移動の値（x）
            top: _offsetTwo.dy, // 移動の値（y）
            child: GestureDetector(
              // ドラッグの移動を更新
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _offsetTwo = Offset(_offsetTwo.dx+details.delta.dx, _offsetTwo.dy+details.delta.dy);
                });
              },
              onVerticalDragUpdate: (DragUpdateDetails details) {
                do {
                  setState(() {
                    _offsetTwo = Offset(_offsetTwo.dx, _offsetTwo.dy + 10);
                  });
                } while (_offsetTwo.dy > 0);
                // ↑これはちゃんと動かない
              },
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: Center(child:Text('Pan\nx:${_offsetTwo.dx.toInt()}\ny:${_offsetTwo.dy.toInt()}'),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}