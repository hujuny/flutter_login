import 'package:flutter/material.dart';
import 'package:flutter_login/home/tabs_page.dart';

/// 主页面
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsPage(),
    );
  }
}
