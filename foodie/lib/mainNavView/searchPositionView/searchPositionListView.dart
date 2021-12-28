import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainNavView/searchPositionView/searchPositionCard.dart';

class SearchPositionListView extends StatefulWidget {
  @override
  State<SearchPositionListView> createState() => _SearchPositionListView();
}
class _SearchPositionListView extends State<SearchPositionListView> {
  bool isRed = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: 18),
          filterBox(),
          SizedBox(height: 16),
          SearchPositionCard(title: '가온', genre: '한식 | 모던한식 | 오리', position: '서울 강남구'),
          SizedBox(height: 13),
          SearchPositionCard(title: '가온', genre: '한식 | 모던한식 | 오리', position: '서울 강남구'),
          SizedBox(height: 13),
          SearchPositionCard(title: '가온', genre: '한식 | 모던한식 | 오리', position: '서울 강남구'),
          SizedBox(height: 13),
          SearchPositionCard(title: '가온', genre: '한식 | 모던한식 | 오리', position: '서울 강남구'),
          SizedBox(height: 13),
          SearchPositionCard(title: '가온', genre: '한식 | 모던한식 | 오리', position: '서울 강남구'),
          SizedBox(height: 13),
          SearchPositionCard(title: '가온', genre: '한식 | 모던한식 | 오리', position: '서울 강남구'),
          SizedBox(height: 13),
          SearchPositionCard(title: '가온', genre: '한식 | 모던한식 | 오리', position: '서울 강남구'),
          SizedBox(height: 13),
        ]
      )
    );
  }

  Widget filterBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            colorFilterBox('red'),
            SizedBox(width: 9),
            colorFilterBox('green')
          ],
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          child: Container(
            width: 61, height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xffededed)
            ),
            child: Center(
              child: Text('1km', style: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 15.0),)
            )
          )
        )
      ]
    );
  }

  Widget colorFilterBox(String color) {
    bool _selected = (color == 'red' && isRed) || (color == 'green' && !isRed);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          if(color == 'red') {
            isRed = true;
          }
          else if(color == 'green') {
            isRed = false;
          }
        });
      },
      child: Container(
        width: 84, height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: _selected ? Color(0xffff851c) : Color(0xffededed),
        ),
        child: Center(
          child: Text(
            color=='red' ? '레드리스트' : '그린리스트',
            style: _selected ? textStyle(color: Colors.white, weight: 700, size: 14.0) : textStyle(color: Color(0xff8e8e8e), weight: 500, size: 14.0)
          )
        )
      )
    );
  }
}