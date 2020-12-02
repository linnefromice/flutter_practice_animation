import 'package:flutter/material.dart';

class RatedHeart extends StatelessWidget {
  RatedHeart({
    Key key,
    @required this.rate,
    this.color = Colors.pink,
    this.size,
  }) : super(key: key);
  final double rate;
  final Color color;
  double size;

  @override
  Widget build(BuildContext context) {
    if (size == null) {
      size = IconTheme.of(context).size;
    }
    return _RatedIcon(
        iconData: Icons.favorite,
        size: size,
        rate: rate,
        color: color
    );
  }
}

class _RatedIcon extends StatelessWidget {
  _RatedIcon({this.iconData, this.size, this.rate, this.color});
  final IconData iconData;
  final double size;
  final double rate;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [color, Colors.white],
        stops: [rate, rate],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: Container(
        child: Center(
          child: Icon(
            iconData,
            size: size,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
