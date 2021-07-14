//免费听书

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vx_reader/base_card.dart';

class CardFree extends BaseCard {
  @override
  _CardFreeState createState() => _CardFreeState();
}

const BOOK_LIST = [
  {'title': '非暴力沟通', 'cover': '51VykQqGq9L._SY346_.jpg', 'price': '19.6'},
  {'title': '论中国', 'cover': '41APiBzC41L.jpg', 'price': '36.6'},
  {'title': '饥饿的盛世：乾隆时代的得与失', 'cover': '51M6M87AXOL.jpg', 'price': '15.92'},
  {'title': '焚天之怒第4卷至大结局', 'cover': '51oIE7H5gnL.jpg', 'price': '56.9'},
  {'title': '我就是风口', 'cover': '51vzcX1U1FL.jpg', 'price': '88.8'},
  {'title': '大宋的智慧', 'cover': '517DW6EbhGL.jpg', 'price': '22.8'}
];

class _CardFreeState extends BaseCardState {
  @override
  topTitle(String title) {
    return super.topTitle('Free for listening!');
  }

  @override
  Widget subTitle(String title) {
    return super.subTitle('Num 108');
  }

  @override
  bottomContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Expanded(child: _bookList()),
            Padding(
                padding: EdgeInsets.only(bottom: 20), child: _bottomButton())
          ],
        ),
      ),
    );
  }

  _bookList() {
    //网格布局@https://coding.imooc.com/learn/list/321.html
    return GridView.count(
      crossAxisCount: 3,
      //垂直间距
      mainAxisSpacing: 10,
      //水平间距
      crossAxisSpacing: 15,
      //长宽比
      childAspectRatio: 0.46,
      padding: EdgeInsets.only(left: 20, right: 20),
      children: BOOK_LIST.map((item) {
        return _item(item);
      }).toList(),
      // BOOK_LIST.map((item) {
      //   return _item(item);
      // }).toList(),
    );
  }

  _bottomButton() {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: RaisedButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.only(top: 13, bottom: 15),
          color: Colors.blue,
          child: Text(
            'Free to Get',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _item(Map<String, String> item) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Image.network(
                'http://www.devio.org/io/flutter_beauty/book_cover/${item['cover']}',
                fit: BoxFit.cover,
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black38),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Text(
                      'Price${item['price']}',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Text(item['title'].toString(),
                maxLines: 2, overflow: TextOverflow.ellipsis),
          )
        ],
      ),
    );
  }
}
