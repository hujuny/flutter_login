import 'package:flutter/material.dart';

/// 忘记密码
class ForgetPasswordPage extends StatefulWidget {
  @override
  ForgetPasswordPageState createState() => ForgetPasswordPageState();
}

class ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("忘记密码"),
        ),
        body: Center(
          child: Text('我是忘记密码页面'),
        ),
      ),
    );
  }
}
