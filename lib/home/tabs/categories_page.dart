import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/utils/toast.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPageState createState() => CategoriesPageState();
}

class CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.index == tabController.animation.value) {}
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {},
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
                    borderRadius:
                    BorderRadius.all(Radius.circular(16.0))),
                child: TextField(
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
                ),
              ),
              
            ],
          )
        ],
      ),
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
