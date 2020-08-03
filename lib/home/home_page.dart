import 'package:flutter/material.dart';

/// 主页面
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("主页面"),
        ),
        body: Center(
          child: Text('我是主页面'),
        ),
      ),
    );
  }
}
