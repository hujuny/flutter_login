import 'package:flutter/material.dart';

class ExpansionDemo extends StatefulWidget {
  @override
  _ExpansionDemoState createState() => _ExpansionDemoState();
}

class _ExpansionDemoState extends State<ExpansionDemo> {
  bool _expanded = false;
  List<bool> dataList = List.generate(2, (index) => false).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion组件'),
      ),
      body: Column(
        children: <Widget>[
          ///ExpandIcon 是一个旋转展开/折叠按钮的组件。
          ExpandIcon(
            ///禁用状态的颜色。onpress=null
            disabledColor: Colors.blue,
            ///打开颜色
            expandedColor: Colors.green,
            size: 24,
            color: Colors.red,
            isExpanded: _expanded,
            onPressed: (value) {
              setState(() {
                _expanded = !value;
              });
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.list),
            subtitle: Text('各种学科'),
            backgroundColor: Colors.yellow,
            ///初始是否打开
            initiallyExpanded: true,
            onExpansionChanged: (value){
              print(value);
            },
            title: Text('学科'),
            children: <Widget>[
              Text('语文'),
              Text('数学'),
              Text('英语'),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              child: _buildExpansionPanelList(),
            ),
          )
        ],
      ),
    );
  }

  ///ListView 下展开/关闭的控件。
  _buildExpansionPanelList() {
    return ExpansionPanelList(
      expansionCallback: (index, isExpanded) {
        setState(() {
          dataList[index] = !isExpanded;
        });
      },
      children: dataList.map((value) {
        return ExpansionPanel(
            isExpanded: value,
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text('老杨'),
              );
            },
            body: Container(
              height: 100,
              color: Colors.greenAccent,
            ));
      }).toList(),
    );
  }
}
