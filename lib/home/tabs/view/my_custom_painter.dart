import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..color = Colors.red
      ..style=PaintingStyle.fill
      ..strokeWidth = 3;

    var _path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return this != oldDelegate;
  }



}
