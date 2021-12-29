import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainNavView/searchPositionView/searchPositionBottomCard.dart';

class SearchPositionBottomContainer extends StatefulWidget {
  final dynamic colorChangeListener;
  final bool isRed;
  SearchPositionBottomContainer({required dynamic this.colorChangeListener, required bool this.isRed});
  @override
  State<SearchPositionBottomContainer> createState() => _SearchPositionBottomContainer();
}
class _SearchPositionBottomContainer extends State<SearchPositionBottomContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: const Color(0x15000000),
          offset: Offset(0,-4),
          blurRadius: 6,
          spreadRadius: 0
        )],
        color: const Color(0xffffffff)
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: 19),
            filterBox(),
            SizedBox(height: 27),
            shopScrollView(cardWidth: MediaQuery.of(context).size.width * 0.9)
          ]
        )
      )
    );
  }

  shopScrollView({required cardWidth}) {
    return Container(
      height: 98,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10*2-1,
        itemBuilder: (BuildContext context, int index) {
          if(index%2==1) return SizedBox(width: 7);
          return SearchPositionBottomCard(title: '가온', genre: '한식 | 모던한식 | 오리', position: '서울 강남구');
        }
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
              border: Border.all(color: const Color(0xffededed), width: 1),
              color: const Color(0xffffffff)
            ),
            child: Center(
              child: Text('1km', style: textStyle(color: serviceColor(), weight: 500, size: 14.0),)
            )
          )
        )
      ]
    );
  }

  Widget colorFilterBox(String color) {
    bool _selected = (color == 'red' && widget.isRed) || (color == 'green' && !widget.isRed);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        widget.colorChangeListener(color);
      },
      child: Container(
        width: 84, height: 35,
        decoration: BoxDecoration(
          color: _selected ? color=='red' ? serviceColor() : Color(0xff66af6e) : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: _selected ? color=='red' ? serviceColor() : Color(0xff66af6e) : Color(0xffededed), width: 1)
        ),
        child: Center(child: Text(color == 'red' ? '레드리스트' : '그린리스트', style: _selected ?
          textStyle(color: Colors.white, weight: 700, size: 14.0) :
          textStyle(color: Color(0xff8e8e8e), weight: 500, size: 14.0)
        ))
      )
    );
  }
}