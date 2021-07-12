import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vx_reader/custom_appbar.dart';

class ContentPager extends StatefulWidget {
  final ValueChanged<int> onPageChanged;
  final ContentPagerController contentPagerController;
  //构造方法,可选参数
  const ContentPager(
      {Key? key,
      required this.onPageChanged,
      required this.contentPagerController})
      : super(key: key); //初始化列表
  @override
  _ContentPagerState createState() => _ContentPagerState();
}

class _ContentPagerState extends State<ContentPager> {
  PageController _pageController = PageController(
      //视图比例
      viewportFraction: 0.8);
  static List<Color> _colors = [
    Colors.blue,
    Colors.red,
    Colors.deepOrange,
    Colors.teal,
  ];
  void initState() {
    widget.contentPagerController._pageController = _pageController;

    _statusBar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //appBar
        CustomeAppBar(),
        Expanded(
            //高度撑开
            child: PageView(
          onPageChanged: widget.onPageChanged,
          controller: _pageController,
          children: <Widget>[
            _wrapItem(0),
            _wrapItem(1),
            _wrapItem(2),
            _wrapItem(3),
          ],
        )) //用来撑开整个布局
      ],
    );
  }

  Widget _wrapItem(int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(color: _colors[index]),
      ),
    );
  }

  _statusBar() {
    //黑色沉浸式状态栏，基于SystemUIOvERLayStyle.dark修改statusBarColor
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

// 内部区域控制器
class ContentPagerController {
  //late 非空变量 但不初始化
  late PageController _pageController;
  void jumpToPage(int page) {
    //dart 编程技巧 安全的调用
    _pageController.jumpToPage(page);
  }
}
