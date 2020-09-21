import 'package:flutter/material.dart';
import 'package:flutter_login/home/tabs/view/my_custom_painter.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    ///监听滚动位置
    _scrollController.addListener(() {
      print("${_scrollController.position}");
    });
  }



  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("主页面"),
          centerTitle: true,
        ),
        body: CustomScrollView(
          controller: _scrollController,
          ///滚动方向垂直或水平
          scrollDirection: Axis.vertical,
          ///反转滚动方向
          reverse: false,
          
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 230.0,
              stretch: false,
              ///拉伸超过 100 时，将会回调 onStretchTrigger 函数。
              stretchTriggerOffset: 1,
              onStretchTrigger: (){
                print("onStretchTrigger");
              },
              ///AppBar 的一部分，它可以扩展，折叠，延伸，最常用于SliverAppBar.flexibleSpace 字段
              flexibleSpace: FlexibleSpaceBar(
                /// StretchMode.zoomBackground- >背景小部件将展开以填充额外的空间。
                /// StretchMode.blurBackground- >使用[ImageFilter.blur]效果，背景将模糊。
                /// StretchMode.fadeTitle- >随着用户过度滚动，标题将消失。
                stretchModes: [StretchMode.fadeTitle,StretchMode.blurBackground,StretchMode.zoomBackground],

                title: Text('复仇者联盟'),
                background: Image.network("http://img.haote.com/upload/20180918/2018091815372344164.jpg",fit: BoxFit.fitHeight,),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 4,
              children: List.generate(8, (index) {
                return Container(
                  color:
                  Colors.primaries[index % Colors.primaries.length],
                  alignment: Alignment.center,
                  child: Text(
                    '$index',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              }).toList(),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((content,index){
              return Container(
                height: 85,
                alignment: Alignment.center,
                color: Colors.primaries[index%Colors.primaries.length],
                child: Text(
                  '$index',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            },childCount: 5),

            )
          ],
        )
      ),
    );
  }


}
