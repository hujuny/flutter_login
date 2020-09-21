import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/utils/navigator_util.dart';
import 'package:flutter_login/utils/toast.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../photo_gallery_page.dart';

class HomesPage extends StatefulWidget {
  HomesPageState createState() => HomesPageState();
}

class HomesPageState extends State<HomesPage> {
  List imageList;
  List bookImageList;
  String categoryList;
  String category;
  List bookList = [];

  @override
  void initState() {
    super.initState();
    category = "全部分类";
    categoryList =
        '''["全部分类","文学","小说","教育","历史","人文社科","经济管理","科学技术","政治军事"]''';
    imageList = [
      "https://www.yanghujun.com/upload/2020/06/mmexport1588832555249-b542560de7854581bdfe5bbeed4871e2.jpg",
      "https://www.yanghujun.com/upload/2020/06/mmexport1591347649539-284e9aee91324815a071387040042dcf.jpg",
      "https://www.yanghujun.com/upload/2020/4/%E5%9B%9B%E6%9C%88%20(1)-1fc17341006d4f00bd7174606e384e49.jpg",
    ];
    bookImageList = [
      {
        'title': '林徽因文集：爱上一座城',
        'imageUrl':
            'http://app2.showapi.com/isbn/568/76f78381533d446382a4ea75068f3f42.jpg',
        'category': '文学'
      },
      {
        'title': '白鹿原精装 陈忠实',
        'imageUrl':
            'http://app2.showapi.com/isbn/535/1dd16d5e9b6d4c719bac4bc30f7bdb8d.jpg',
        'category': '小说'
      },
      {
        'title': '三毛流浪记',
        'imageUrl':
            'http://app2.showapi.com/isbn/532/898878f563ad41ff97bd06a18ecde39c.jpg',
        'category': '小说'
      },
      {
        'title': 'Android App开发从入门到精通',
        'imageUrl':
            'http://app2.showapi.com/isbn/302/9efe62917b8b4782ba76e88f75dffeb7.jpg',
        'category': '科学技术'
      },
      {
        'title': 'C程序设计',
        'imageUrl':
            'http://app2.showapi.com/isbn/imgs/a1ad855f1a4e486ea1e710dcd325107a.jpg',
        'category': '教育'
      },
      {
        'title': '哈利·波特与被诅咒的孩子',
        'imageUrl':
            'http://app2.showapi.com/isbn/img9/018f3c893e3b43059c9d51df1df17336.jpg',
        'category': '小说'
      },
      {
        'title': '高等数学',
        'imageUrl':
            'http://app2.showapi.com/isbn/040/6896ee05f4ed4be79fbd8817beeb9601.jpg',
        'category': '教育'
      },
      {
        'title': 'Android开发艺术探索',
        'imageUrl':
            'http://app2.showapi.com/isbn/img/5a2f44b77c194482982bc0a15b572b00.jpg',
        'category': '科学技术'
      },
      {
        'title': '深入理解Java虚拟机：JVM高级特性与最佳实践',
        'imageUrl':
            'http://app2.showapi.com/isbn/71114/f0931edce0e44696b2614d0ff1993dda.jpg',
        'category': '科学技术'
      },
    ];
    bookList.addAll(bookImageList);
  }

  //选择框模板
  showPickerModal(BuildContext context, var JsonData) {
    Picker(
        height: 190,
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(JsonData)),
        changeToFirst: true,
        hideHeader: false,
        cancelTextStyle: TextStyle(
          color: Color.fromRGBO(203, 203, 203, 1),
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
        ),
        confirmTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
        ),
        selectedTextStyle: TextStyle(color: Colors.blue),
        columnPadding: EdgeInsets.only(bottom: 40),
        onConfirm: (Picker picker, List value) {
          category = formatStr(picker.adapter.text);
          bookList = [];
          switch (category) {
            case "全部分类":
              bookList.addAll(bookImageList);
              break;
            case "文学":
            case "小说":
            case "教育":
            case "历史":
            case "人文社科":
            case "经济管理":
            case "科学技术":
            case "政治军事":
              bookImageList.forEach((element) {
                if (element['category'] == category) {
                  bookList.add(element);
                }
              });
              break;
          }
          setState(() {});
        }).showModal(this.context); //_scaffoldKey.currentState);
  }

  String formatStr(String str) {
    String resultStr = str;
    resultStr = resultStr.replaceAll(" ", "");
    resultStr = resultStr.replaceAll(",", "/");
    resultStr = resultStr.replaceAll("/]", "");
    resultStr = resultStr.replaceAll("]", "");
    resultStr = resultStr.replaceAll("[", "");
    return resultStr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 200,
                    child: AspectRatio(
                        //适配屏幕
                        aspectRatio: 16 / 9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(20)),
                          clipBehavior: Clip.antiAlias,
                          child: Swiper(
                            itemCount: imageList.length,
                            //分页原点
                            pagination: SwiperPagination(),
                            //左右箭头
//                control: SwiperControl(),
                            autoplay: true,
                            itemBuilder: (context, index) {
                              return Image.network(
                                imageList[index],
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ))),
                Card(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text(category),
                          trailing: IconButton(
                            onPressed: () {
                              showPickerModal(context, categoryList);
                            },
                            icon: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                        bookShow(),
                      ],
                    ))
              ],
            ),
          ],
        ));
  }

  Widget bookShow() {
    if (bookList.length > 0) {
      return GridView.builder(
        itemCount: bookList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Image.network(
                    bookList[index]['imageUrl'],
                  ),
                  iconSize: 70,
                  onPressed: () {
                    NavigatorUtil.push(
                        context,
                        PhotoGalleryPage(
                          photoList: bookList,
                          index: index,
                          heroTag: "simple",
                        ));
                  },
                ),
                Text(
                  bookList[index]['title'],
                  style: TextStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        },
      );
    } else {
      return Container(
        height: 0,
      );
    }
  }
}
