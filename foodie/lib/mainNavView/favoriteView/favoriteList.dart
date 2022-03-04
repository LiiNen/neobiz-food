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
            // todo: position
            var _shopId = _temp['shopId'];
            var _reviewId = _temp['id'];
            var _infoText = '${_temp['bigCategoryName']}';
            if(_temp['middleCategoryName'] != null) _infoText = _infoText + ' | ${_temp['middleCategoryName']}';
            if(_temp['smallCategoryName'] != null) _infoText = _infoText + ' | ${_temp['smallCategoryName']}';
            var _position = _temp['roadAddress'].split(' ')[0] + ' ' + _temp['roadAddress'].split(' ')[1];
            return FavoriteItemSlidable (
              shopId: _temp['shopId'], thumbnail: _temp['shopImage'],
              title: _temp['shopName'], genre: _infoText, position: _position,
              rating: _temp['foodielogRating'],
              pushCallback: () {_shopViewRoute(_shopId, _infoText);},
              shareCallback: () {},
              deleteCallback: () {_deleteCallback(_reviewId);},
            );
          }
        })
      )
    );
  }
  
  _shopViewRoute(int shopId, String _infoText) {
    //todo: info text
    navigatorPush(context: context, widget: ShopView(shopNo: shopId, infoText: _infoText));
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