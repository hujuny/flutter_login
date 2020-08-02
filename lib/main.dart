import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'login/login_page.dart';

void main() {
  runApp(MyApp());

  if (Platform.isAndroid) {
    //设置Android状态栏为透明沉浸
    //写在组件渲染之后，是为了在渲染之后进行setSystemUIOverlayStyle赋值，覆盖状态栏
    //写在渲染之前MaterialApp组件会覆盖这个值
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //强制竖屏
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: LoginPage(),
      ),
      //路由配置
      routes: {
        '/router/login_page': (context) => LoginPage(),
      },
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        CupertinoLocalizationsDelegate()
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
      ],
    );
  }
}

//IOS国际化
class CupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate old) => true;
}
