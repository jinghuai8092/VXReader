import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vx_reader/content_pager.dart';

//底部导航框架

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final ContentPagerController _contentPagerController =
      ContentPagerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0XFFEDEEF0),
            Color(0XFFE6E7E9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        //装饰器描述样式
        child: ContentPager(
          contentPagerController: _contentPagerController,
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          //修改当前状态
          setState(() {
            _currentIndex = index;
          });
          _contentPagerController.jumpToPage(index);
        },
        //文字固定或者设置为不选中不显示
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem('This Week', Icons.folder, 0),
          _bottomItem('Share', Icons.explore, 1),
          _bottomItem('Free', Icons.donut_small, 2),
          _bottomItem('My', Icons.account_box, 3),
        ],
      ),
    ); //Scaffold()代表一个页面的布局结构( 页面结构)
  }

//封装底部Tab
  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }
}
