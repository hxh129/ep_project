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
  PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );
  double _currentPage = 1.0;
  int _selectedPage = 0;

  // int _viewPageItemCount = 3;

  double _pageHeight = 205.0;
  double _scaleFactor = 0.8;

  late List<String> _vpImages;

  @override
  void initState() {
    _vpImages = [
      'images/icon_vp1.png',
      'images/icon_vp2.png',
      'images/icon_vp3.png',
    ];

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
      backgroundColor: Colors.white,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            height: 44,
            color: Colors.white,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(bottom: 2),
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
          Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: _pageHeight,
                  padding: EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onHorizontalDragEnd: (de) {
                      print("end----");
                    },
                    onHorizontalDragCancel: () {
                      print("cancel----");
                    },
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _vpImages.length + 2,
                      onPageChanged: (index) async {
                        print("pageChange--->$index");
                        if (index == 0) {
                          _selectedPage = _vpImages.length - 1;
                          await Future.delayed(Duration(milliseconds: 400));
                          _pageController.jumpToPage(_vpImages.length);
                        } else if (index == _vpImages.length + 1) {
                          _selectedPage = 0;
                          await Future.delayed(Duration(milliseconds: 400));
                          _pageController.jumpToPage(1);
                        } else {
                          _selectedPage = index - 1;
                        }
                        // _selectedPage = index;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return _buildPageItem(index);
                      },
                    ),
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
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
                  height: 205,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        padding: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "代办实现",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFF333333)),
                            ),
                           IconButton(onPressed: (){},padding: EdgeInsets.all(0), icon:Image.asset('images/icon_more.png'),)
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                ClipRRect(
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                ClipRRect(
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                ClipRRect(
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                ClipRRect(
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currentPage.floor()) {
      ///当前页
      var currentScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
      var currTans = _pageHeight * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1.0, currentScale, 1.0)
        ..setTranslationRaw(0.0, currTans, 0.0);
    } else if (index == _currentPage.floor() + 1) {
      ///往左边滑动
      var currentScale =
          _scaleFactor + (_currentPage - index + 1) * (1 - _scaleFactor);
      var currTans = _pageHeight * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1.0, currentScale, 1.0)
        ..setTranslationRaw(0.0, currTans, 0.0);
    } else if (index == _currentPage.floor() - 1) {
      ///左边
      var currentScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
      var currTans = _pageHeight * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1.0, currentScale, 1.0)
        ..setTranslationRaw(1.0, currTans, 1.0);
    } else {
      matrix4 = Matrix4.diagonal3Values(1.0, _scaleFactor, 1.0)
        ..setTranslationRaw(0.0, _pageHeight * (1 - _scaleFactor) / 2, 0.0);
    }
    String imagePathname;
    if (index == 0) {
      imagePathname = _vpImages[_vpImages.length - 1];
    } else if (index == _vpImages.length + 1) {
      imagePathname = _vpImages[0];
    } else {
      imagePathname = _vpImages[index - 1];
    }
    return Transform(
      transform: matrix4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imagePathname,
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          // color: index == 0
          //     ? Colors.red
          //     : (index == 1 ? Colors.blueAccent : Colors.green),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    // print("_buildPageIndicator__currentPage:$_currentPage");
    List<Widget> list = [];
    for (int i = 0; i < _vpImages.length; i++) {
      list.add(i == _selectedPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      alignment: Alignment.center,
      height: 10,
      child: AnimatedContainer(
        duration: Duration(microseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 3),
        height: 8.0,
        width: isActive ? 16 : 8.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4),
          color: isActive ? Color(0XFF4076DA) : Color(0XFFD8D8D8),
        ),
      ),
    );
  }
}
