import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoGalleryPage extends StatefulWidget {
  final List photoList;
  final int index;
  String heroTag;
  PhotoGalleryPage({this.photoList, this.index,this.heroTag});
  @override
  _PhotpGalleryPageState createState() => _PhotpGalleryPageState();
}

class _PhotpGalleryPageState extends State<PhotoGalleryPage> {
  @override
  int currentIndex = 0;
  int initialIndex; //初始index
  int length;
  int title;
  String heroTag;
  @override
  void initState() {
    currentIndex = widget.index;
    initialIndex = widget.index;
    length = widget.photoList.length;
    title = initialIndex + 1;
    heroTag=widget.heroTag;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
      title = index + 1;
    });
  }

  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      title: Text('${title} / ${length}'),
      centerTitle: true,
    ),
    body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollDirection: Axis.horizontal,
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(widget.photoList[index]['imageUrl']),
                  initialScale: PhotoViewComputedScale.contained * 1,
                    heroTag: heroTag,
                );
              },
              itemCount: widget.photoList.length,
              // loadingChild: widget.loadingChild,
              backgroundDecoration: BoxDecoration(
                color: Colors.black,
              ),
              pageController: PageController(initialPage: initialIndex), //点进去哪页默认就显示哪一页
              onPageChanged: onPageChanged,
            ),
            Align(
              alignment: Alignment(0.0, 0.8),
              child: Text(
                widget.photoList[currentIndex]['title'],
                style: const TextStyle(color: Colors.white, fontSize: 17.0, decoration: null),
              ),
            )
          ],

        )),
  );
  }
}