import 'package:flutter/material.dart';
import 'dart:math' as math;

class WaveClipper extends CustomClipper<Path> {
  WaveClipper(this.context, this.waveControllerValue, this.offset) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    for (var i = 0; i<= width / 3; i++) {
      final step = (i / width) - waveControllerValue;
      coordinateList.add(
        Offset(
          i.toDouble() * 3,
          math.sin(step * 2 * math.pi - offset) * 45 + height * 0.5,
        ),
      );
    }
  }

  final BuildContext context;
  final double waveControllerValue; // waveController.valueの値
  final double offset; // 波のずれ
  final List<Offset> coordinateList = []; // 波の座標のリスト

  @override
  Path getClip(Size size) {
    final path = Path()
    // addPolygon: coordinateListに入っている座標を直線で結ぶ。
    //             false -> 最後に始点に戻らない
      ..addPolygon(coordinateList, false)
      ..lineTo(size.width, size.height) // 画面右下へ
      ..lineTo(0, size.height) // 画面左下へ
      ..close(); // 始点に戻る
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      waveControllerValue != oldClipper.waveControllerValue;
}

class WaveScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<WaveScreen> with SingleTickerProviderStateMixin {
  AnimationController waveController;
  static const darkBlue = Color(0xFF264bc5);

  @override
  void initState() {
    waveController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: waveController,
        builder: (context, child) => Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: darkBlue),
              clipper: WaveClipper(
                context,
                waveController.value,
                0
              ),
            ),
            ClipPath(
              child: Container(color: darkBlue.withOpacity(0.6)),
              clipper: WaveClipper(
                context,
                waveController.value,
                0.5
              ),
            ),
            ClipPath(
              child: Container(color: darkBlue.withOpacity(0.3)),
              clipper: WaveClipper(
                context,
                waveController.value,
                0.3
              )
            ),
          ],
        )
      )
    );
  }
}