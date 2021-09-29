import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';

class ShopViewTabInfo extends StatefulWidget {
  final dynamic shopJson;
  ShopViewTabInfo(this.shopJson);
  @override
  State<ShopViewTabInfo> createState() => _ShopViewTabInfo(shopJson);
}
class _ShopViewTabInfo extends State<ShopViewTabInfo> {
  dynamic shopJson;
  _ShopViewTabInfo(this.shopJson);

  List<String> _addressList = ['주소', '전화번호', '찾아오는 길'];
  List<String> _addressIndexList = ['address', 'phone', 'search_road'];

  List<String> _elseList = ['영업시간', '휴무일', '메뉴', '추천메뉴', '예산', '홈페이지', '주차장'];
  List<String> _elseIndexList = ['time', 'rest_day', 'menu', 'rec_menu', 'pre_cost', 'homepage', 'park'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          detailBox(descriptionContainer()),
          spaceDivider(),
          detailBox(detailContainer(_addressList, _addressIndexList)),
          spaceDivider(),
          detailBox(detailContainer(_elseList, _elseIndexList)),
          spaceDivider(),

        ]
      )
    );
  }

  detailBox(child) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 21, horizontal: 18),
      child: child
    );
  }

  descriptionContainer() {
    return Text(htmlTagRemover(shopJson['explain']), style: textStyle(weight: 400, size: 14.0));
  }

  detailContainer(nameList, indexList) {
    List<Widget> _childrenList = [];
    for(var i = 0; i < nameList.length; i++) {
      if(shopJson[indexList[i]] != '') { // return data가 없는 경우
        _childrenList.add(Text(nameList[i], style: textStyle(weight: 500, size: 15.0),));
        _childrenList.add(SizedBox(height: 2));
        _childrenList.add(Text(shopJson[indexList[i]], style: textStyle(weight: 400, size: 14.0),));

        if(i+1 != nameList.length) {
          _childrenList.add(SizedBox(height: 12));
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _childrenList
    );
  }
}