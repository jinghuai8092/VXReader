//分享得到联名卡

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:vx_reader/base_card.dart';

class CardShare extends BaseCard {
  @override
  _CardShareState createState() => _CardShareState();
}

class _CardShareState extends BaseCardState {
  @override
  bottomContent() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(color: Color(0xff6f7f9)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end, //水平向右

        children: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: 20, left: 15, bottom: 20),
            child: Image.network(
                'https://ucarecdn.com/43dcf28e-161e-4932-86c6-b369fdd6c321/-/format/auto/-/preview/3000x3000/-/quality/lighter/'),
          )),
          Container(
            alignment: AlignmentDirectional.center,
            child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: bottomTitle('17 people ~ participated in the activity')),
          )
        ],
      ),
    ));
  }

  @override
  topTitle(String title) {
    return super.topTitle('Share Card');
  }

  @override
  Widget subTitle(String title) {
    return super.subTitle(
        'Share with friends to get up to 12 days unlimited reading card');
  }

  @override
  topTitle2() {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(
        '/Num 19',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
