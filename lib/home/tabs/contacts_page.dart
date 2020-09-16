import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/utils/toast.dart';

class ContactsPage extends StatefulWidget {
  ContactsPageState createState() => ContactsPageState();
}

class ContactsPageState extends State<ContactsPage> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('联系人'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Wrap(
              spacing: 15,
              children: List.generate(8, (index) {
                return ChoiceChip(
                  label: Text('联系人$index'),
                  selected: _selectIndex == index,
                  onSelected: (value) {
                    setState(() {
                      _selectIndex = index;
                    });
                  },
                );
              }).toList(),
            ),
            Row(
              children: <Widget>[
                ActionChip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey.shade800,
                    child: Text('杨'),
                  ),
                  label: Text('老杨'),
                  onPressed: () {
                    Toast.toast(context, msg: "点击了一下");
                  },
                ),
                ChipTheme(
                  data: ChipThemeData.fromDefaults(
                      primaryColor: Colors.red,
                      secondaryColor: Colors.blue,
                      labelStyle: TextStyle()),
                  child: RawChip(
                    label: Text('老杨'),
                  ),
                ),
                CircleAvatar(
                  child: Text('老杨'),
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.red,
//                backgroundImage: AssetImage('images/change.png',),
                ),
              ],
            ),
            Container(
              ///改变图片颜色，
              ///BlendMode.modulate混合模式参考![](https://blog.csdn.net/chenlove1/article/details/84574237)
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.red, BlendMode.modulate),
                child: Image.asset("images/change_color.png"),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    "https://www.yanghujun.com/upload/2019/12/heart-5f900bb03cab4755bbac1c7124b03bc8.jpg",
                    height: 100,
                  ),
                ),
                Expanded(
                  ///可以实现类似滤镜效果
                  child: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(Colors.pink[200], BlendMode.modulate),
                    child: Image.network(
                      "https://www.yanghujun.com/upload/2019/12/heart-5f900bb03cab4755bbac1c7124b03bc8.jpg",
                      height: 100,
                    ),
                  ),
                )
              ],
            ),

            ///可以作用于任何组件，某一个区域变为灰色
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
              child: Container(
                height: 30,
                color: Colors.red,
              ),
            ),
            Container(
              height: 50,
              child: Row(
                ///水平方向布局
                textDirection: TextDirection.rtl,

                ///主轴尺寸，默认
                mainAxisSize: MainAxisSize.max,

                ///默认
                mainAxisAlignment: MainAxisAlignment.start,
//              mainAxisAlignment: MainAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.end,
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
                ///默认
                crossAxisAlignment: CrossAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.start,
                ///使子控件填满交叉轴
//                crossAxisAlignment: CrossAxisAlignment.stretch,
//              crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.red,
                  ),
                  Container(
                    height: 30,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),

            ///固定宽高比的组件，
            AspectRatio(
              aspectRatio: 4 / 1,
              child: Container(
                color: Colors.red,
              ),
            ),
            Container(
              height: 110,
              color: Colors.grey,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.red,
                  ),
                  Flexible(
                    ///2 个控件之间的间隔是当前父控件的 10%，可以使用无子控件的FractionallySizedBox
                    child: FractionallySizedBox(
                      heightFactor: .8,
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.blue,
                  ),

                  ///当不受父组件约束时限制它的尺寸
                  ///没有约束的父组件有ListView、Row、Column 等
                  ///，如果 LimitedBox 的父组件受到约束，此时LimitedBox 将会不做任何操作，我们可以认为没有这个组件，
                  ListView(
                    shrinkWrap: true, 								//解决无限高度问题
                    physics: new NeverScrollableScrollPhysics(),		//禁用滑动事件
                    children: <Widget>[
                      LimitedBox(
                        maxHeight: 5,
                        child: Container(
                          color: Colors.green,
                        ),
                      ),
                      LimitedBox(
                        maxHeight: 5,
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50,right: 30),
              child: Text('技术改变生活！',textDirection: TextDirection.ltr,),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50,right: 50),
              child: Text('技术改变生活！'),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
            )

          ],
        ));
  }
}
