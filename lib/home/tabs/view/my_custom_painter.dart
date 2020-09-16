import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint= Paint()
      ..color=Colors.red
      ..strokeWidth=3;
    var points=[
      Offset(0,0),
      Offset(size.width/2,size.height/2),
      Offset(size.width,size.height),
    ];
    canvas.drawPoints(PointMode.points, points, _paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
