import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/home/tabs/bean/app_update_info.dart';
import 'package:flutter_login/login/login_page.dart';
import 'package:flutter_login/utils/api.dart';
import 'package:flutter_login/utils/dio_utils.dart';
import 'package:flutter_login/utils/navigator_util.dart';
import 'package:flutter_login/utils/toast.dart';

class MyPage extends StatefulWidget {
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  List myList = [
    {"title": "推荐给好友", "imageUrl": "images/tuijian.png"},
    {"title": "意见反馈", "imageUrl": "images/suggestion.png"},
    {"title": "信息修改", "imageUrl": "images/change.png"},
    {"title": "在线升级", "imageUrl": "images/shengjipng.png"},
    {"title": "客服助手", "imageUrl": "images/kefu.png"},
  ];

  ///获取版本信息
  getUpdateInformation() async {
    Map<String, dynamic> bodyParams = {};
    DioUtils.get(bodyParams, url: API.App_Update_Information,
        onSuccess: (data) {
      ///获取App版本号参考package_info包
      if (data['versionCode'] > 1) {
        showUpdateDialog(data['versionName'], data['description']);
      } else {
        Toast.toast(context, msg: "最新版本，无需升级");
      }
    }, onError: (error) {
      Toast.toast(context, msg: "请求失败,请重试！");
    });
  }

  showUpdateDialog(versionName, description) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(versionName),
            content: Text(description),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.pop(context, "cancle"); //对话框消失
                },
              ),
              FlatButton(
                child: Text('确定'),
                onPressed: () {
                  Navigator.pop(context, "ok"); //对话框消失
                },
              ),
            ],
          );
        });
  }

  showSimpleDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('提示'),
            children: <Widget>[
              Container(
                height: 80,
                alignment: Alignment.center,
                child: Text('确认删除吗？'),
              ),
              Divider(
                height: 1,
              ),

              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop('cancel');
                },
              ),
              Divider(
                height: 1,
              ),
              FlatButton(
                child: Text('确认'),
                onPressed: () {
                  Navigator.of(context).pop('ok');
                },
              ),
            ],
          );
        });
    print(result);
  }

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
              child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      if (index == 3) {
                        getUpdateInformation();
                      }
                      if (index == 2) {
                        showSimpleDialog();
                      }
                    },
                    leading: Image.asset(
                      myList[index]["imageUrl"],
                      width: 20,
                      height: 20,
                    ),
                    title: Text(
                      myList[index]["title"],
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
                itemCount: myList.length),
          )),
          Expanded(
              child: Center(
                  child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: RaisedButton(
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  '退出登录',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, letterSpacing: 10.0),
                ),
              ),
              onPressed: () {
                NavigatorUtil.pop(context);
                NavigatorUtil.push(context, LoginPage());
              },
            ),
          )))
        ],
      ),
    );
  }
}
