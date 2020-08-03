import 'package:flutter/material.dart';

/// 注册页面
class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("注册"),
        ),
        body: Center(
          child: Text('我是注册页面'),
        ),
      ),
    );
  }
}
