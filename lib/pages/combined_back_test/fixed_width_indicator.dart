import 'package:flutter/material.dart';

class FixedWidthIndicator extends Decoration {
  final double width;
  final double height;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final double paddingRight;
  final Color color;

  const FixedWidthIndicator({
    required this.width,
    this.height = 4,
    this.topLeft = 2,
    this.topRight = 2,
    this.bottomLeft = 2,
    this.bottomRight = 2,
    this.paddingRight = 0,
    this.color = Colors.red,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _FixedWidthPainter(this);
  }
}

class _FixedWidthPainter extends BoxPainter {
  final FixedWidthIndicator decoration;

  _FixedWidthPainter(this.decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = decoration.color
      ..style = PaintingStyle.fill;

    final double xCenter = offset.dx +
        (configuration.size!.width -
            decoration.paddingRight -
            decoration.width) /
            2;
    final double y = offset.dy + configuration.size!.height - decoration.height;

    final Rect rect = Rect.fromLTWH(
      xCenter,
      y,
      decoration.width,
      decoration.height,
    );

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topLeft: Radius.circular(decoration.topLeft),
        topRight: Radius.circular(decoration.topRight),
        bottomLeft: Radius.circular(decoration.bottomLeft),
        bottomRight: Radius.circular(decoration.bottomRight),
      ),
      paint,
    );
  }
}
