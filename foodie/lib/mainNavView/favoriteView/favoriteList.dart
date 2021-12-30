import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/mainNavView/favoriteView/favoriteItemSlidable.dart';
import 'package:foodie/mainNavView/searchPositionView/searchPositionCard.dart';

class FavoriteGreenList extends StatefulWidget {
  @override
  State<FavoriteGreenList> createState() => _FavoriteGreenList();
}
class _FavoriteGreenList extends State<FavoriteGreenList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('green')
    );
  }
}

class FavoriteRedList extends StatefulWidget {
  @override
  State<FavoriteRedList> createState() => _FavoriteRedList();
}
class _FavoriteRedList extends State<FavoriteRedList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(10*2-1,(index) {
          if(index%2==1) return lineDivider();
          return FavoriteItemSlidable(title: '가온', genre: '한식 | 모던한식 | 오리', position: '서울 강남구');
        })
      )
    );
  }
}