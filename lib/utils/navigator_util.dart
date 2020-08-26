import 'package:flutter/material.dart';

class NavigatorUtil {
  ///跳转到指定页面
  static push(BuildContext context, Widget page) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }



  ///返回上一页面
  static pop(BuildContext context) {
    return Navigator.pop(context);
  }
}
