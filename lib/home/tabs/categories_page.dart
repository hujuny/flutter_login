import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/home/datatable/datatable_demo.dart';
import 'package:flutter_login/home/datatable/datatable_page.dart';
import 'package:flutter_login/home/draggable/draggable_demo.dart';
import 'package:flutter_login/home/tabs/expansion_demo.dart';
import 'package:flutter_login/home/tabs/view/follow_the_leader.dart';
import 'package:flutter_login/home/tabs/view/my_custom_painter.dart';
import 'package:flutter_login/home/tabs/view/my_singlechildLayoutdelegate.dart';
import 'package:flutter_login/utils/navigator_util.dart';
import 'package:flutter_login/utils/toast.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPageState createState() => CategoriesPageState();
}

class CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  TabController tabController;
  AnimationController animationController;
  var _checkValue = false;

  var _value = "语文";
  AnimationController fadeTransitionController;
  Animation<double> fadeTransitionAnimation;

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

    ///淡入淡出动画
     fadeTransitionController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))..repeat();
    fadeTransitionAnimation=Tween(begin: 0.0,end: 1.0).animate(fadeTransitionController);
    fadeTransitionController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    fadeTransitionController.dispose();
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
              MyButton(
                text: 'Warp组件',
                onPressed: () {
                  NavigatorUtil.push(context, ExpansionDemo());
                },
              ),
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
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: CustomSingleChildLayout(
                  delegate: MySingleChildLayoutDelegate(Offset(20, 10)),
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.red,

                ///定义文本的方向，默认文本从左到右，但有些国家的文字从右到左，比如阿拉伯
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text("吼吼"),
                ),
              ),

              ///Dismissible 组件可通过左滑或者右滑清除列表项
              Dismissible(
                ///confirmDismiss 参数确认是否移除组件，
                confirmDismiss: (DismissDirection direction) async {
                  return false;
                },
                key: ValueKey('key'),
                child: Container(
                  height: 80,
                  color: Colors.red,
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
                onPressed: () => NavigatorUtil.push(context, DraggableDemo()),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      DefaultAssetBundle.of(context)
                          .loadString("assets/json/update.json")
                          .then((value) {
                        print(value);
                      });
                    },
                    child: Text('FlatButton'),
                  ),
                  OutlineButton(
                    child: Text('OutlineButton'),
                    onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DataTableDemo()))
                        .then((value) {
                      //强制竖屏
                      SystemChrome.setPreferredOrientations(
                          [DeviceOrientation.portraitUp]);
                    }),
                  ),
                  RaisedButton(
                    child: Text('RaisedButton'),
                    onPressed: () {
                      NavigatorUtil.push(context, DataTablePage());
                    },
                  )
                ],
              ),

              ///实现组件拖动
              Draggable(
                ///控制拖动的方向
                axis: Axis.vertical,

                ///回调事件(4种)
                ///开始拖动时回调
                onDragStarted: () {},

                ///拖动结束时回调
                onDragEnd: (DraggableDetails details) {
                  print("${details.offset}");
                },

                ///未拖动到 DragTarget 控件上时回调
                onDraggableCanceled: (velocity, offset) {
                  print("$velocity:$offset");
                },

                ///拖动到 DragTarget 控件上时回调
                onDragCompleted: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text('哇哇哇'),
                ),

                ///拖动的时候子组件显示其他样式
                childWhenDragging: Container(
                  width: 50,
                  height: 50,
                  child: Text(
                    '哈哈哈',
                    style: TextStyle(color: Colors.black),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                ),
                feedback: Container(
                  width: 50,
                  height: 50,
                  child: Text('哇哇哇'),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),

              /// DropdownButtonFormField 是一个组合控件，将[DropdownButton]包装在FormField 中
              DropdownButtonFormField(
                hint: Text("请选择"),
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Text('语文'),
                    value: '语文',
                  ),
                  DropdownMenuItem(
                    child: Text('数学'),
                    value: '数学',
                  ),
                  DropdownMenuItem(
                    child: Text('英语'),
                    value: '英语',
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                selectedItemBuilder: (context) {
                  return [
                    OutlineButton(
                      child: Text('语文'),
                      onPressed: () {},
                    ),
                    OutlineButton(
                      child: Text('数学'),
                      onPressed: () {},
                    ),
                    OutlineButton(
                      child: Text('英语'),
                      onPressed: () {},
                    ),
                  ];
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  myDropdownButton(),
                  DropdownButtonHideUnderline(
                    child: myDropdownButton(),
                  )
                ],
              ),
              FadeTransition(
                opacity: fadeTransitionAnimation,
                child: Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 10),
                width: 50,
                height: 50,
                color: Colors.green,
                ///当子组件的宽高比和父组件的宽高比不一样时，我们等比拉伸或者填充父组件
                child: FittedBox(
                  child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  ///Flexible 组件可以控制 Row、Column、Flex 的子控件占满父控件
                  ///子控件占比 = 当前子控件 flex/所有子控件 flex 之和
                  ///Flexible 中 fit 参数表示填满剩余空间的方式
                  ///tight：必须（强制）填满剩余空间。
                  ///loose：尽可能大的填满剩余空间，但是可以不填满。
                  ///填满剩余空间直接使用 Expanded 更方便
                  Flexible(
                    flex: 1,
                    child:  Container(
                      color: Colors.blue,
                      height: 50,
                    ),
                  ),
                  ///Spacer 的子控件尺寸是 0，Spacer 适用于撑开 Row、Column、Flex 的子控件的空隙
                  Spacer(
                    flex: 1,
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                      height: 50,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                Flexible(
                  flex: 3,
                  child:   Container(
                    color: Colors.blue,
                    height: 50,
                  ),
                )
                ],
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                ///根据 Offset 平移控件
                child: FractionalTranslation(
                  translation: Offset(0.25,0.2),
                  child: Container(
                    color: Colors.red,
                  ),
                ),
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

  /// 组合控件
  Widget myDropdownButton() {
    return DropdownButton(
      value: _value,
      underline: Divider(
        color: Colors.red,
        height: 5,
        thickness: 5,
      ),
      items: [
        DropdownMenuItem(
          child: Text('语文'),
          value: '语文',
        ),
        DropdownMenuItem(child: Text('数学'), value: '数学'),
        DropdownMenuItem(child: Text('英语'), value: '英语'),
      ],
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
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
  final VoidCallback onPressed;

  const MyButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(this.text),
      textColor: Theme.of(context).accentColor,
    );
  }
}
