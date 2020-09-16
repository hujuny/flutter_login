import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/home/tabs/view/follow_the_leader.dart';
import 'package:flutter_login/home/tabs/view/my_custom_painter.dart';
import 'package:flutter_login/utils/toast.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPageState createState() => CategoriesPageState();
}

class CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  TabController tabController;
  AnimationController animationController;
  var _checkValue = false;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.index == tabController.animation.value) {}
    });

    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animationController.forward();
            }
          });
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, //键盘不顶起来下面布局
      appBar: AppBar(
        centerTitle: true,
        title: Text('分类'),
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(
              text: '借阅',
            ),
            Tab(
              text: '归还',
            ),
            Tab(
              text: '逾期',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              MyButton(text: 'warp组件'),
              MyButton(text: 'button组件'),
              MyButton(text: 'ListView组件'),
              MyButton(text: 'GridView组件'),
              MyButton(text: '路由跳转'),
              MyButton(text: 'Row组件'),
              MyButton(text: 'Column组件'),
              MyButton(text: 'Expanded组件'),

              ///约束子组件的最大宽高和最小宽高
              ///ConstrainedBox默认值
              ///minWidth=0.0；maxWidth=double.infinity, //无限大
              ///minHeight=0.0;maxHeight=double.infinity, //无限大
              ///对于BoxConstraints嵌套使用的，
              ///多级 BoxConstraints 嵌套约束最大值最终值等于多个 BoxConstraints 约束中的最小值。
              ///同理嵌套约束最小值等于多个 BoxConstraints 约束中的最大值。
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 30, maxWidth: 110),
                child: Container(
                  height: 300,
                  width: 110,
                  color: Colors.red,
                  child: Text('ConstrainedBox'),
                ),
              ),
              Container(
                height: 120,
                width: 120,

                ///黄色区域表示子控件超出父控件的区域了，黄色区域只会在 debug 模式下存在，在 release 模式下，只有红色区域。
                ///UnconstrainedBox 虽然不限制其子控件的大小，但仍然受父控件的约束，超出父控件的区域将会截取。
                child: UnconstrainedBox(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                  ),
                ),
              ),

              ///SizedBox 可以没有子组件，但仍然会占用空间，所以 SizedBox 非常适合控制 2 个组件之间的空隙，
              SizedBox(
                child: Text(
                  'SizedBox',
                  style: TextStyle(color: Colors.red),
                ),
                width: 80,
                height: 60,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://www.yanghujun.com/upload/2019/12/heart-5f900bb03cab4755bbac1c7124b03bc8.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),

                    ///圆角图片
//                  borderRadius: BorderRadius.circular(12),
                    ///圆形图片
                    shape: BoxShape.circle),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                color: Colors.blue,
                child: Text('八归少年'),
                alignment: Alignment.center,
                height: 60,
                width: 100,
                transform: Matrix4.rotationZ(0.5),
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.red,
                child: CustomMultiChildLayout(
                  delegate: FollowTheLeader(),
                  children: <Widget>[
                    LayoutId(
                      id: FollowTheLeaderId.leader,
                      child: Text('大朗'),
                    ),
                    LayoutId(
                      id: FollowTheLeaderId.follower,
                      child: Text('该吃药了'),
                    )
                  ],
                ),
              ),

            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  //applicationIcon：应用程序的图标。
                  //applicationName：应用程序名称。
                  //applicationVersion：应用程序版本。
                  //applicationLegalese：升级描述。
                  //children：位置如上图的红蓝绿色的位置。
                  showAboutDialog(
                      context: context,
                      applicationIcon: Icon(Icons.update),
                      applicationName: "应用程序",
                      applicationVersion: "1.1.1",
                      useRootNavigator: true,
                      applicationLegalese: "阳光明媚，惠风和畅。",
                      children: <Widget>[Center(child: Text('自定义内容'))]);

                  ///点击查看许可跳转到showLicensePage()页面
                },
                child: Text('FlatButton'),
              ),
              OutlineButton(
                child: Text('OutlineButton'),
                onPressed: () => null,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Text('FlatButton'),
                  ),
                  OutlineButton(
                    child: Text('OutlineButton'),
                    onPressed: () => null,
                  ),
                  RaisedButton(
                    child: Text('RaisedButton'),
                    onPressed: () {},
                  )
                ],
              ),
              CustomPaint(
                painter: MyCustomPainter(),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: inputContent(),
              ),
              AboutListTile(
                icon: Icon(Icons.android),
                child: Text('AboutListTile'),
                applicationIcon: Icon(Icons.arrow_back_ios),
                applicationName: "应用程序",
                applicationVersion: "1.1.1",
                applicationLegalese: "阳光明媚，惠风和畅。",
              ),

              ///同样效果控件IgnorePointer
              ///区别：AbsorbPointer 本身可以接收点击事件，消耗掉事件，而 IgnorePointer 无法接收点击事件，其下的控件可以接收到点击事件（不是子控件）。
              AbsorbPointer(
                ///响应点击事件设置为false
                absorbing: false,
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                    ),
                    RaisedButton(
                      onPressed: () {},
                    ),
                    RaisedButton(
                      onPressed: () {},
                    ),
                    RaisedButton(
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                child: AnimatedIcon(
                  icon: AnimatedIcons.view_list,
                  progress: animationController,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Center(
                  child: Container(
                    color: Colors.red.withOpacity(0),
                    child: Text(
                      '我是一个程序猿',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Banner(
                message: '程序猿',
                location: BannerLocation.bottomStart,
              ),
              Checkbox(
                activeColor: Colors.red,
                checkColor: Colors.blue,
                value: _checkValue,
                onChanged: (value) {
                  setState(() {
                    _checkValue = value;
                  });
                },
              ),
              CheckboxListTile(
                onChanged: (bool value) {
                  setState(() {
                    _checkValue = value;
                  });
                },
                subtitle: Text('我是一个程序员'),
                secondary: Icon(Icons.print),
                value: _checkValue,
                title: Text('程序员'),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              GestureDetector(
                onTap: () => null,
                child: RawChip(
                  selected: true,
                  showCheckmark: true,
                  checkmarkColor: Colors.lightBlueAccent,
                  onPressed: () {
                    Toast.toast(context, msg: "前置对勾");
                  },
                  //左侧控件，可选
                  avatar: CircleAvatar(
                    child: Text('杨'),
                  ),
                  //禁用状态
                  isEnabled: false,
                  elevation: 8,
                  shadowColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: Text('老杨'),
                  onDeleted: () {
                    Toast.toast(context, msg: "删除");
                  },
                  selectedColor: Colors.blue,
                  selectedShadowColor: Colors.yellow,
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.red,
                  deleteButtonTooltipMessage: '删除',
                  labelStyle: TextStyle(color: Colors.blue),
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  ///输入框
  Widget inputContent() {
    return TextField(
      maxLines: 4,
      controller: TextEditingController.fromValue(TextEditingValue(
        text: '',
      )),
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: '请输入内容',
        helperStyle: TextStyle(
          color: Colors.blue,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 0.0),
      ),
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(30)
      ],
      onChanged: (str) {
        if (str.length > 30) {
          Toast.toast(context, msg: '不能超过30个字哟');
        } else {
          //do something
        }
      },
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;

  const MyButton({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text(this.text),
      textColor: Theme.of(context).accentColor,
    );
  }
}
