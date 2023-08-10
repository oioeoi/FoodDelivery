import 'package:flutter/material.dart';

class DotIndicator extends Decoration {
  final Color color;
  final double radius;

  DotIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChange]) {
    return _DotIndicator(color: color, radius: radius);
  }
}

class _DotIndicator extends BoxPainter {
  final double radius;
  late Color color;

  _DotIndicator({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height / 2 - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
