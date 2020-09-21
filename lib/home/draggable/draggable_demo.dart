import 'package:flutter/material.dart';
import 'package:flutter_login/home/draggable/draggablescrollableactuator_demo.dart';
import 'package:flutter_login/home/draggable/draggabletarget_demo.dart';
import 'package:flutter_login/utils/navigator_util.dart';
import 'package:flutter_login/utils/toast.dart';

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  var _account = '';
  var _pwd = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              child: Text('DragTarget'),
              onPressed: () =>
                  NavigatorUtil.push(context, DraggableTargetDemo()),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              child: Text('DraggableScrollableActuator'),
              onPressed: () => NavigatorUtil.push(
                  context, DraggableScrollableActuatorDemo()),
            ),
          ),
          Form(
            key: _formKey,
            onWillPop: () async {
              return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('提示'),
                      content: Text('确认退出吗？'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('取消'),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        FlatButton(
                          child: Text('确认'),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  });
            },
            child: Column(
              children: <Widget>[
                TextFormField(
                  ///onSaved 是一个可选参数，当 Form 调用 FormState.save 时才会回调此方法。
                  onSaved: (value) {
                    _account = value;
                  },
                  decoration: InputDecoration(hintText: '输入账号'),

                  ///autovalidate 参数为是否自动验证，设置为 true 时，TextField 发生变化就会调用
                  ///validator，设置 false 时，FormFieldState.validate 调用时才会回调 validator，
                  ///如果Form 的 autovalidate 设置为 true，TextFormField 忽略此参数。
                  autovalidate: true,

                  ///validator 验证函数，输入的值不匹配的时候返回的字符串显示在 TextField 的errorText 属性位置，返回 null，表示没有错误。
                  validator: (value) {
                    return value.length >= 5 ? null : "账号最少5个字符";
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: '输入密码'),
                  obscureText: true,
                  autovalidate: true,
                  onSaved: (value) {
                    _pwd = value;
                  },
                  validator: (value) {
                    return value.length >= 5 ? null : '账号最少 5 个字符';
                  },
                ),
                RaisedButton(
                  child: Text('登录'),
                  onPressed: () {
                    //在这里不能通过此方式获取FormState，context不对
                    //print(Form.of(context));
                    // 通过_formKey.currentState 获取FormState后，
                    // 调用validate()方法校验用户名密码是否合法，校验
                    // 通过后再提交数据。
                    if (_formKey.currentState.validate()) {
                      //验证通过提交数据
                      Toast.toast(context, msg: "请求成功");
                    } else {
                      Toast.toast(context, msg: "请求失败");
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
