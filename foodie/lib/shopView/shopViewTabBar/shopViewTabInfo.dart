import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/serviceViews/supportView.dart';

class ShopViewTabInfo extends StatefulWidget {
  final dynamic shopJson;
  ShopViewTabInfo(this.shopJson);
  @override
  State<ShopViewTabInfo> createState() => _ShopViewTabInfo(shopJson);
}
class _ShopViewTabInfo extends State<ShopViewTabInfo> {
  dynamic shopJson;
  _ShopViewTabInfo(this.shopJson);

  List<String> _firstList = ['영업시간', '휴무일', '추천메뉴', '예산'];
  List<String> _firstIndexList = ['time', 'rest_day', 'rec_menu', 'pre_cost'];

  List<String> _secondList = ['홈페이지', '주차장'];
  List<String> _secondIndexList = ['homepage', 'park'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          detailBox(descriptionContainer()),
          spaceDivider(),
          detailBox(detailContainer(_firstList, _firstIndexList)),
          spaceDivider(),
          detailBox(detailContainer(_secondList, _secondIndexList)),
          spaceDivider(),
          detailMenuBox()
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

  //todo: fixing style
  descriptionContainer() {
    return Html(
      data: shopJson['explain']
    );
    // return Text(htmlTagRemover(shopJson['explain']), style: textStyle(weight: 400, size: 14.0));
  }

  detailContainer(nameList, indexList) {
    List<Widget> _childrenList = [];
    for(var i = 0; i < nameList.length; i++) {
      if(shopJson[indexList[i]] != '') { // return data가 없는 경우
        _childrenList.add(Text(nameList[i], style: textStyle(color: Color(0xff4d4d4d), weight: 500, size: 15.0),));
        _childrenList.add(SizedBox(height: 2));
        _childrenList.add(Text(shopJson[indexList[i]], style: textStyle(color: Color(0xff393939), weight: 400, size: 14.0),));

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

  detailMenuBox() {
    return Container(
      margin: EdgeInsets.only(top: 22, bottom: 60),
      child: Column(
        children: [
          fullWidthShadowButton('오류신고', bugReport),
          SizedBox(height: 26),
          ownerButton(),
          SizedBox(height: 26),
        ]
      )
    );
  }

  ownerButton() {
    return yellowPointBox(
      context: context,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('식당주이신가요?', style: textStyle(color: Color(0xffff9933), weight: 700, size: 13.0)),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              //todo: 직접관리 페이지
              print('todo 직접관리');
            },
            child: Container(
              height: 47,
              child: Center(child: Text('직접관리', style: textStyle(color: Color(0xffff9933), weight: 500, size: 12.0))),
            )
          )
        ]
      )
    );
  }

  bugReport() {
    navigatorPush(context: context, widget: SupportView(supportId: 0, title: shopJson['name']));
  }
}