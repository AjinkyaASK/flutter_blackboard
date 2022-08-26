import 'dart:ui';

import 'package:flutter/material.dart';

class CanvasView extends CustomPainter {
  CanvasView(this.points);

  final List<Offset?> points;

  final Paint paintDetails = Paint()
    ..color = Colors.white
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    for (int index = 0; index < points.length; index++) {
      if (index != points.length - 1 &&
          points[index] != null &&
          points[index + 1] != null) {
        canvas.drawLine(points[index]!, points[index + 1]!, paintDetails);
      } else if (points[index] != null) {
        canvas.drawPoints(PointMode.points, [points[index]!], paintDetails);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
