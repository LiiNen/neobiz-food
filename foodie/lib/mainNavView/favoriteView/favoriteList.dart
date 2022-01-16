import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainNavView/favoriteView/favoriteItemSlidable.dart';
import 'package:foodie/shopView/shopView.dart';

class FavoriteGreenList extends StatefulWidget {
  final List<dynamic> _favoriteList;
  FavoriteGreenList(this._favoriteList);
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
  final List<dynamic> _favoriteList;
  FavoriteRedList(this._favoriteList);
  @override
  State<FavoriteRedList> createState() => _FavoriteRedList();
}
class _FavoriteRedList extends State<FavoriteRedList> {
  @override
  Widget build(BuildContext context) {
    if(widget._favoriteList.length == 0) {
      return Container();
    }
    else return Container(
      child: Column(
        children: List.generate(widget._favoriteList.length*2-1, (index) {
          if(index%2==1) return lineDivider();
          else {
            var _temp = widget._favoriteList[(index/2).floor()];
            // todo: genre, position
            return FavoriteItemSlidable (
              shopId: _temp['shopId'], thumbnail: _temp['shopImage'],
              title: _temp['shopName'], genre: '장르', position: '서울 강남구',
              rating: _temp['foodielogRating'],
              pushCallback: () {_shopViewRoute(_temp['shopId']);},
            );
          }
        })
      )
    );
  }
  
  _shopViewRoute(int shopId) {
    //todo: info text
    navigatorPush(context: context, widget: ShopView(shopNo: shopId, infoText: '장르인듯?'));
  }
}