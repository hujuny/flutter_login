import 'package:flutter/material.dart';

class DraggableTargetDemo extends StatefulWidget {
  @override
  _DraggableTargetState createState() => _DraggableTargetState();
}

class _DraggableTargetState extends State<DraggableTargetDemo> {

  var _dragData;

  _buildDraggable() {
    ///LongPressDraggable 继承自 Draggable，因此用法和 Draggable完全一样，唯一的区别就是 LongPressDraggable 触发拖动的方式是长按，而 Draggable 触发拖动的方式是按下。
    return Draggable(
      data: Color(0x000000FF),
      child: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        child: Text(
          '吼',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      feedback: Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: DefaultTextStyle.merge(
          style: TextStyle(color: Colors.white, fontSize: 18),
          child: Text(
            '哈',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DragTarge'),
      ),
      body: Column(
        children: <Widget>[
            _buildDraggable(),
            SizedBox(
              height: 200,
            ),
          ///指定一个目的地，Draggable 组件可以拖动到此控件
          DragTarget<Color>(
              builder: (BuildContext context, List<Color> candidateData,
                  List<dynamic> rejectedData) {
                print(
                    'candidateData:$candidateData,rejectedData:$rejectedData');
                return _dragData == null
                    ? Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)),
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          '嘿',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      );
              },
              onWillAccept: (Color color) {
                print('onWillAccept:$color');
                return true;
              },
              onAccept: (Color color) {
                setState(() {
                  _dragData = color;
                });
                print('onAccept:$color');
              },
              onLeave: (color) {
                print("$color");
              },
            ),

        ],
      ),
    );
  }
}
