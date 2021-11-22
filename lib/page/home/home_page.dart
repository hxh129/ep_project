import 'package:flutter/material.dart';
import 'package:untitled/page/base_page.dart';
import 'package:untitled/page/util/color_util.dart';

class HomePage extends BasePage {
  const HomePage(this.title, {Key? key}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  double _currentPage = 0;
  int _viewPageItemCount = 3;
  late List<String> _vpImages;
  @override
  void initState() {
    _vpImages =['images/icon_vp1.png','images/icon_vp2.png','images/icon_vp3.png',];

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final size =MediaQuery.of(context).size;
    // final width =size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: ColorUtil.color_5BBBD6,
        elevation: 0,
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Container()),
              Container(
                width: 100,
                height: 30,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: new BoxDecoration(
                  color: Color(0x45FFFFFF), //背景
                  //设置四周圆角 角度
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text("1-1"),Text("2-2")
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'images/icon_back.png',
                        fit: BoxFit.scaleDown,
                        height: 10,
                      ),
                      padding: EdgeInsets.only(left: 5),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'images/icon_main.png',
                        fit: BoxFit.scaleDown,
                        height: 16,
                      ),
                      padding: EdgeInsets.only(right: 2),
                    )
                  ],
                ),
              ),
              Expanded(child: Container()),
            ],
          )
        ],
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 44,
              color: Colors.white,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(bottom: 5),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Expanded(child: Container()),
                Text(
                  "今天天气: 晴",
                  style: TextStyle(
                      fontSize: 16,
                      color: ColorUtil.color_666666,
                      fontWeight: FontWeight.normal),
                ),
                Image(image: AssetImage('images/icon_weather.png'))
              ]),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 220,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _viewPageItemCount,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 200,width:100,
                          child: ClipRRect(
                            child: Image(image: AssetImage(_vpImages[index]),),
                            borderRadius:BorderRadius.all(Radius.circular(20)),
                          ));
                      },
                    ),
                    color: Colors.white,
                  ),
                  Container(
                    height: 20,
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: _buildPageIndicator(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _viewPageItemCount; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      height: 10,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive ? 10 : 8.0,
        width: isActive ? 12 : 8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: Color(0XFF2FB7B2).withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0,
                      0.0,
                    ),
                  )
                : BoxShadow(
                    color: Colors.transparent,
                  )
          ],
          shape: BoxShape.circle,
          color: isActive ? Color(0XFF6BC4C9) : Color(0XFFEAEAEA),
        ),
      ),
    );
  }
}
