import 'package:flutter/material.dart';
import 'package:untitled/page/focus/focus_page.dart';
import 'package:untitled/page/home/home_page.dart';
import 'package:untitled/page/mine/mine_page.dart';
import 'package:untitled/page/notice/notice_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List _pageList;
  late var _currentIndex;
  late List<BottomNavigationBarItem> bottomItems;

  @override
  void initState() {
    // TODO: implement initState
    _pageList = [HomePage(), NoticePage(), FocusPage(), MinePage()];
    _currentIndex = 0;
    bottomItems = [
      BottomNavigationBarItem(
        icon: Image.asset('images/image_home.png',), label: "首页",),
      BottomNavigationBarItem(
        icon: Image.asset('images/image_notice.png',), label: "公告",),
      BottomNavigationBarItem(
        icon: Image.asset('images/image_focus.png',), label: "关注",),
      BottomNavigationBarItem(
        icon: Image.asset('images/image_mine.png',), label: "我的",)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
