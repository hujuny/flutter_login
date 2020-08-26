import 'package:flutter/material.dart';
import 'package:flutter_login/login/login_page.dart';
import 'package:flutter_login/utils/navigator_util.dart';

class MyPage extends StatefulWidget {
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  List MyList = [
    {"title": "推荐给好友", "imageUrl": "images/tuijian.png"},
    {"title": "意见反馈", "imageUrl": "images/suggestion.png"},
    {"title": "信息修改", "imageUrl": "images/change.png"},
    {"title": "在线升级", "imageUrl": "images/shengjipng.png"},
    {"title": "客服助手", "imageUrl": "images/kefu.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('我的'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: ClipOval(
                    child: Image.network(
                      "https://www.yanghujun.com/upload/2019/12/heart-5f900bb03cab4755bbac1c7124b03bc8.jpg",
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '八归少年\n18219747421',
                      style: TextStyle(fontSize: 20),
                    ),
//                  Text('18219747421',style: TextStyle(fontSize: 20))
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.all(10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(
                        MyList[index]["imageUrl"],
                        width: 20,
                        height: 20,
                      ),
                      title: Text(
                        MyList[index]["title"],
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(height: 1, color: Colors.grey);
                  },
                  itemCount: MyList.length),
            ),
          ),
          Expanded(
              child:   Center(child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20,right: 20),
                child:  RaisedButton(
                  color: Colors.blue,
                  child: Padding(padding: EdgeInsets.only(top: 10,bottom: 10),child: Text('退出登录',style: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 10.0),),),
                  onPressed: () {
                    NavigatorUtil.pop(context);
                    NavigatorUtil.push(context, LoginPage());
                  },

                ),
              ))
          )
        ],
      ),
    );
  }
}
