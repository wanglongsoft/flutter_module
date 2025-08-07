import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartPainter extends CustomPainter {
  final List<double> data;
  final double padding = 20;

  LineChartPainter({required this.data});

  Offset local = Offset(0, 0);

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint("paint....... width: ${size.width} height: ${size.height}");
    final paint =
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke
          ..isAntiAlias = true;

    // canvas.drawLine(Offset(0, 0), Offset(size.width, 0), paint);
    // canvas.drawPoints(PointMode.points, [
    //   Offset(0, 0),
    //   Offset(50, 50),
    //   Offset(100, 100),
    // ], paint);
    // canvas.drawPoints(PointMode.lines, [
    //   Offset(10, 10),
    //   Offset(50, 60),
    //   Offset(100, 110),
    // ], paint);
    // canvas.drawPoints(PointMode.polygon, [
    //   Offset(10, 20),
    //   Offset(50, 70),
    //   Offset(100, 120),
    // ], paint);

    // 绘制折线
    // Path path = Path();
    // List<Offset> od = [
    //   Offset(0, 0),
    // ];
    // path.moveTo(0, 0);
    // for (int i = 1; i < data.length; i++) {
    //   path.lineTo(i * 50, data[i]);
    //   od.add(Offset(i * 50, data[i]));
    // }
    // canvas.drawPath(path, paint);
    //
    // paint.color = Colors.redAccent;
    // canvas.drawPoints(PointMode.polygon, od, paint);
    // paint
    //   ..color = Color(0xFFDCC48C)
    //   ..strokeWidth = 1
    //   ..style = PaintingStyle.fill;
    // canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paint);
    //
    // paint
    //   ..color = Colors.redAccent
    //   ..style = PaintingStyle.fill;
    // canvas.drawCircle(Offset(70, 70), 50, paint);
    //
    // paint
    //   ..color = Colors.deepPurpleAccent
    //   ..style = PaintingStyle.stroke;
    //
    // Path path = Path();
    // path.moveTo(10.w, 10.w);
    // path.lineTo(50.w, 50.w);
    // path.lineTo(200.w, 120.w);
    // path.lineTo(220.w, 420.w);
    // path.lineTo(620.w, 520.w);
    // canvas.drawPath(path, paint);
    //
    paint
      ..color = Colors.black
      ..strokeWidth = 6.w
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawPoints(PointMode.polygon, [
      Offset(0, 0),
      Offset(10.w, 20.w),
      Offset(20.w, 30.w),
      Offset(100.w, 30.w),
      Offset(200.w, 80.w),
      Offset(400.w, 580.w),
      Offset(600.w, 700.w),
    ], paint);
    //
    // paint
    //   ..color = Colors.greenAccent
    //   ..strokeWidth = 2
    //   ..strokeCap = StrokeCap.round
    //   ..style = PaintingStyle.stroke;
    // canvas.drawRRect(
    //   RRect.fromRectXY(
    //     Rect.fromLTRB(1, 1, size.width - 1, size.height - 1),
    //     10.w,
    //     10.w,
    //   ),
    //   paint,
    // );

    paint
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTRB(local.dx, local.dy, local.dx + 40.w, size.height - 2), paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  bool isPointInside(Offset point) {
    debugPrint("isPointInside........ $point");
    local = point;
    return true;
  }
}
