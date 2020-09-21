import 'package:flutter/material.dart';

class DraggableScrollableActuatorDemo extends StatefulWidget {
  @override
  _DraggableScrollableActuatorDemoState createState() =>
      _DraggableScrollableActuatorDemoState();
}

class _DraggableScrollableActuatorDemoState
    extends State<DraggableScrollableActuatorDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DraggableScrollableActuator'),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.network(
                    'https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00774-259.jpg'),
                Container(
                  height: 200,
                  child: Text('电影介绍'),
                  color: Colors.grey,
                  alignment: Alignment.center,
                )
              ],
            ),
            Positioned.fill(
              ///重置其位置到初始化状态，
                child:DraggableScrollableActuator(
                  ///可以在屏幕上拖动
                  child:  DraggableScrollableSheet(
                    ///expand 属性表示是否充满父组件，大部分情况下设置 true，
                    ///如果父组件将根据其所需大小来定位此组件时需要设置为 false，
                    expand: false,
                    initialChildSize: 0.4,
                    minChildSize: 0.4,
                    maxChildSize: 1,
                    builder:
                        (BuildContext context, ScrollController scrollController) {
                      return Container(
                        color: Colors.blue[100],
                        child: ListView.builder(
                            controller: scrollController,
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text('评论$index'),
                                onTap: (){
                                  ///点击恢复起始状态
                                  DraggableScrollableActuator.reset(context);
                                },
                              );
                            }),
                      );
                    },
                  ),
                ))
          ],
        ));
  }
}
