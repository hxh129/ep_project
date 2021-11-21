import 'package:flutter/material.dart';
import 'package:untitled/page/base_page.dart';
import 'package:untitled/page/util/color_util.dart';

class MinePage extends BasePage {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我的"),backgroundColor: ColorUtil.color_5BBBD6,) ,
    );
  }
}
