import 'package:flutter/material.dart';
import 'package:flutter_login/home/tabs/view/my_custom_painter.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyCustomPainter(),
    );
  }
}
