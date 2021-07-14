import 'package:flutter/material.dart';
import 'package:vx_reader/base_card.dart';

//本周推荐
class CardRecommend extends BaseCard {
  @override
  _CardRecommendState createState() => _CardRecommendState();
}

class _CardRecommendState extends BaseCardState {
  @override
  void initState() {
    subTitleColor = Color(0xffb99444);
    super.initState();
  }

  @override
  topTitle(String title) {
    return super.topTitle('Week Recommended');
  }

  @override
  Widget subTitle(String title) {
    return super.subTitle(
        'Recommended books this week for free reading throughout the week!');
  }

  @override
  bottomContent() {
    return Expanded(
        child: Container(
      constraints: BoxConstraints.expand(),
      margin: EdgeInsets.only(top: 20),
      child: Image.network(
        'https://www.booklistqueen.com/wp-content/uploads/book-club-books-2021-Pinterest.jpg',
        fit: BoxFit.cover,
      ),
    ));
  }
}
