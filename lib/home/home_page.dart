import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_login/home/tabs_page.dart';
import 'package:flutter_login/utils/navigator_util.dart';
import 'package:flutter_picker/PickerLocalizationsDelegate.dart';

import '../main.dart';

/// 主页面
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        CupertinoLocalizationsDelegate(),
        PickerLocalizationsDelegate.delegate, // 如果要使用本地化，请添加此行，则可以显示中文按钮
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        const FallbackCupertinoLocalisationsDelegate(),
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
      ],
      home: Scaffold(
        body: TabsPage(),
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: UserAccountsDrawerHeader(
                    accountName: Text("杨虎军"),
                    accountEmail: Text('1364115532@qq.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.yanghujun.com/upload/2019/12/heart-5f900bb03cab4755bbac1c7124b03bc8.jpg"),
                    ),
                    decoration: BoxDecoration(color: Colors.yellow),
                    otherAccountsPictures: <Widget>[
                      Image.network(
                          "https://www.yanghujun.com/upload/2019/12/heart-5f900bb03cab4755bbac1c7124b03bc8.jpg"),
                      Image.network(
                          "https://www.yanghujun.com/upload/2019/12/heart-5f900bb03cab4755bbac1c7124b03bc8.jpg")
                    ],
                  ),
                )
              ],
            ),
            ListTile(
              leading: ClipOval(
                child: Image.network(
                    "https://www.yanghujun.com/upload/2019/12/heart-5f900bb03cab4755bbac1c7124b03bc8.jpg"),
              ),
              title: Text('我的网站'),
            ),
            Divider(
              color: Colors.red,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            ),
            ListTile(
              leading: ClipOval(
                child: Image.network(
                    "https://www.yanghujun.com/upload/2019/12/heart-5f900bb03cab4755bbac1c7124b03bc8.jpg"),
              ),
              title: Text('我的空间'),
              onTap: () {
                //监听
                NavigatorUtil.pop(context);
                NavigatorUtil.push(context, HomePage());
              },
            ),
            Divider(
              color: Colors.red,
            ),
          ],
        )),
      ),
    );
  }
}
class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => true;
}