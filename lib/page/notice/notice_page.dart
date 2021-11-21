import 'package:flutter/material.dart';
import 'package:untitled/page/base_page.dart';
import 'package:untitled/page/util/color_util.dart';

class NoticePage extends BasePage {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("公告"),backgroundColor: ColorUtil.color_5BBBD6,) ,
    );
  }
}
