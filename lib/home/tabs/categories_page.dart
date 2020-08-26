import 'package:flutter/material.dart';

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
          Center(
            child: Text('借阅'),
          ),
          Center(
            child: Text('归还'),
          ),
          Center(
            child: Text('逾期'),
          )
        ],
      ),
    );
  }
}
