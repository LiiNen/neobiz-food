import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainNavView/favoriteView/favoriteItemSlidable.dart';
import 'package:foodie/restApi/favoriteApi.dart';
import 'package:foodie/shopView/shopView.dart';

class FavoriteGreenList extends StatefulWidget {
  final List<dynamic> _favoriteList;
  final dynamic reload;
  FavoriteGreenList(this._favoriteList, {this.reload});
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
  final dynamic reload;
  FavoriteRedList(this._favoriteList, {this.reload});
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
            var _shopId = _temp['shopId'];
            print(_temp);
            var _reviewId = _temp['id'];
            return FavoriteItemSlidable (
              shopId: _temp['shopId'], thumbnail: _temp['shopImage'],
              title: _temp['shopName'], genre: '장르', position: '서울 강남구',
              rating: _temp['foodielogRating'],
              pushCallback: () {_shopViewRoute(_shopId);},
              shareCallback: () {},
              deleteCallback: () {_deleteCallback(_reviewId);},
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

  _shareCallback(int shopId) {

  }

  _deleteCallback(int id) async {
    var response = await deleteFavorite(id);
    if(response == true) {
      widget.reload();
    }
    else {
      showToast('네트워크 에러');
    }
  }
}