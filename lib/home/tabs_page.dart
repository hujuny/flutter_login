import 'package:flutter/material.dart';
import 'package:flutter_login/home/tabs/categories_page.dart';
import 'package:flutter_login/home/tabs/contacts_page.dart';
import 'package:flutter_login/home/tabs/homes_page.dart';
import 'package:flutter_login/home/tabs/my_page.dart';
import 'package:flutter_login/utils/toast.dart';

class TabsPage extends StatefulWidget {
  final int index;

  const TabsPage({Key key, this.index=0}) : super(key: key);

  @override
  TabsPageState createState() => TabsPageState(this.index);
}

class TabsPageState extends State<TabsPage> {
  TabsPageState(index) {
    this.num = index;
  }

  int num = 0;

  List pageList = [HomesPage(), CategoriesPage(), ContactsPage(), MyPage()];

  List pageTextList = [
    Text('首页'),
    Text('分类'),
    Text('联系人'),
    Text('我的'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(2.5),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60), color: Colors.white),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () {
            Toast.toast(context,msg: "欢迎来到主页面");
          },
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pageList[this.num],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.num,
        onTap: (index) {
          this.num = index;
          setState(() {});
        },
        elevation: 100.0,
        type: BottomNavigationBarType.fixed,

        /// 配置三个以上需要使用iconSize
        iconSize: 30,
        fixedColor: Colors.blue,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: pageTextList[0]),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: pageTextList[1]),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone), title: pageTextList[2]),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: pageTextList[3])
        ],
      ),
    );
  }
}
