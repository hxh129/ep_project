import 'package:flutter/material.dart';
import 'package:untitled/page/focus/focus_page.dart';
import 'package:untitled/page/home/home_page.dart';
import 'package:untitled/page/mine/mine_page.dart';
import 'package:untitled/page/notice/notice_page.dart';

import 'util/color_util.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List _pageList;
  late var _currentIndex;
  late List<BottomNavigationBarItem> _bottomItems;
  late List<String> _titles;

  @override
  void initState() {
    _titles = ["首页", "公告", "关注", "我的"];
    _pageList = [
      HomePage(_titles.first),
      NoticePage(),
      FocusPage(),
      MinePage()
    ];
    _currentIndex = 0;
    _bottomItems = [
      BottomNavigationBarItem(
          icon: Image.asset('images/icon_home.png',
              width: 24, height: 24, fit: BoxFit.fill),
          activeIcon: Image.asset('images/icon_home.png',
              width: 24, height: 24, fit: BoxFit.fill),
          label: "Home",
          tooltip: ""),
      BottomNavigationBarItem(
        icon: Image.asset('images/icon_notice.png',
            width: 24, height: 24, fit: BoxFit.fill),
        activeIcon: Image.asset('images/icon_notice.png',
            width: 24, height: 24, fit: BoxFit.fill),
        label: "公告",
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/icon_focus.png',
            width: 24, height: 24, fit: BoxFit.fill),
        activeIcon: Image.asset('images/icon_focus.png',
            width: 24, height: 24, fit: BoxFit.fill),
        label: "关注",
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'images/icon_mine.png',
          width: 24,
          height: 24,
          fit: BoxFit.fill,
        ),
        activeIcon: Image.asset('images/icon_mine.png',
            width: 24, height: 24, fit: BoxFit.fill),
        label: "我的",
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        unselectedItemColor: ColorUtil.color_202020,
        selectedItemColor: ColorUtil.color_2B8BA6,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
