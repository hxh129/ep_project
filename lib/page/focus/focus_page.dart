
import 'package:flutter/material.dart';
import 'package:untitled/page/base_page.dart';
import 'package:untitled/page/util/color_util.dart';
///关注首页
class FocusPage extends BasePage {
  const FocusPage({Key? key}) : super(key: key);

  @override
  _FocusPageState createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("关注"),backgroundColor: ColorUtil.color_5BBBD6,) ,
    );
  }
}
