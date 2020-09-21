import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_login/home/tabs/homes_page.dart';
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

  final GlobalKey<ScaffoldState> _globalKey=new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    //强制竖屏
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
        //取消键盘弹起时,背景图片会跟随上移变形的情况,
        resizeToAvoidBottomInset: false,
        key: _globalKey,
        body: TabsPage(),
        ///抽屉导航
        ///endDrawer右边抽屉
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
                      FadeInImage(
                        ///动画的时长和动画曲线
                        fadeOutDuration: Duration(milliseconds: 200),
                        fadeInCurve: Curves.easeIn,
                        placeholder: AssetImage("images/tuijian.png"),
                        image: NetworkImage("https://www.yanghujun.com/upload/2019/12/heart-5f900bb03cab4755bbac1c7124b03bc8.jpg"),
                      ),
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
              Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
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