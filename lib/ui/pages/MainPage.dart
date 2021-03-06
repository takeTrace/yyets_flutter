import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yyets/ui/pages/SearchPage.dart';
import 'package:flutter_yyets/ui/widgets/HomeDrawer.dart';
import 'package:flutter_yyets/utils/tools.dart';

import 'RankPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 6, vsync: this);
    //非web检查更新
    if (!PlatformExt.isWeb) {
      checkUpgrade(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("排名"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchPageDelegate());
            },
            icon: Icon(Icons.search),
          )
        ],
        bottom: TabBar(
          controller: _controller,
          labelColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          isScrollable: true,
          tabs: <Widget>[
            Tab(text: "今日"),
            Tab(text: "本月"),
            Tab(text: "电影"),
            Tab(text: "新剧"),
            Tab(text: "日剧"),
            Tab(text: "全部"),
          ],
        ),
      ),
      body: RankPage(_controller),
      drawer: HomeDrawer(),
      floatingActionButton:Container(
        alignment: Alignment.bottomRight,
        child: Column(
          verticalDirection: VerticalDirection.up,
          children:[
          Padding(
            padding: EdgeInsets.only(
                bottom: 10
            ),
            child: FloatingActionButton(
              tooltip: "资讯",
              backgroundColor: Colors.blueAccent,
              onPressed: () async{
                Navigator.pushNamed(context, "/news");
              },
              child: Icon(
                Icons.inbox,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 10
            ),
            child: FloatingActionButton(
              heroTag: null,
              tooltip: "下载管理",
              backgroundColor: Colors.blueAccent,
              onPressed: () async {
                Navigator.pushNamed(context, "/download");
              },
              child: Icon(
                Icons.download_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      )
    );
  }
}
