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
  List<String> _firstIndexList = ['operationTime', 'holiday', 'recommandMenu', 'budget'];

  List<String> _secondList = ['홈페이지', '주차장'];
  List<String> _secondIndexList = ['homepage', 'isParking'];

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
      data: shopJson['history']
    );
    // return Text(htmlTagRemover(shopJson['explain']), style: textStyle(weight: 400, size: 14.0));
  }

  detailContainer(nameList, indexList) {
    List<Widget> _childrenList = [];
    for(var i = 0; i < nameList.length; i++) {
      if(shopJson[indexList[i]] != null) { // return data가 없는 경우
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
          blogReviewBox(),
          SizedBox(height: 25),
          detailOptionBox(),
          SizedBox(height: 35),
          fullWidthShadowButton('오류신고', bugReport),
          SizedBox(height: 26),
          ownerButton(),
          SizedBox(height: 26),
        ]
      )
    );
  }

  blogReviewBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              //todo: naver blog link
            },
            child: Container(
              width: 143, height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(21)),
                border: Border.all(color: const Color(0xffe6e6e6), width: 1),
                boxShadow: [BoxShadow(color: const Color(0x0a000000), offset: Offset(0,3), blurRadius: 2, spreadRadius: 0)] ,
                color: const Color(0xffffffff)
              ),
              child: Row(
                children: [
                  SizedBox(width: 7),
                  Image.asset('asset/image/icoNaverblog.png', width: 24),
                  SizedBox(width: 8),
                  Text('블로그 리뷰 보기', style: textStyle(color: Color(0xff1cb900), weight: 500, size: 13.0)),
                ]
              )
            )
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              //todo: instagram link
            },
            child: Container(
              width: 143, height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(21)),
                  border: Border.all(color: const Color(0xffe6e6e6), width: 1),
                  boxShadow: [BoxShadow(color: const Color(0x0a000000), offset: Offset(0,3), blurRadius: 2, spreadRadius: 0)] ,
                  color: const Color(0xffffffff)
              ),
              child: Row(
                children: [
                  SizedBox(width: 7),
                  Image.asset('asset/image/icoInstagram.png', width: 24),
                  SizedBox(width: 8),
                  Text('인스타 피드 보기', style: textStyle(color: Color(0xffbf3294), weight: 500, size: 13.0)),
                ]
              )
            )
          )
        ]
      )
    );
  }

  detailOptionBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('세부옵션', style: textStyle(color: Color(0xff4d4d4d), weight: 500, size: 15.0)),
          SizedBox(height: 29),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //todo: href
                      },
                      child: Image.asset('asset/image/icoReservation.png', width: 55),
                    ),
                    SizedBox(height: 9),
                    Text('예약', style: textStyle(weight: 400, size: 13.0))
                  ]
                ),
                SizedBox(width: 27),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //todo: href
                      },
                      child: Image.asset('asset/image/icoPackage.png', width: 55),
                    ),
                    SizedBox(height: 9),
                    Text('포장', style: textStyle(weight: 400, size: 13.0))
                  ]
                ),
                SizedBox(width: 27),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //todo: href
                      },
                      child: Image.asset('asset/image/icoDelivery.png', width: 55),
                    ),
                    SizedBox(height: 9),
                    Text('배달', style: textStyle(weight: 400, size: 13.0))
                  ]
                ),
              ]
            )
          )
        ]
      )
    );
  }

  ownerButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: yellowPointBox(
        context: context,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('식당주이신가요?', style: textStyle(color: Color(0xffff9933), weight: 700, size: 13.0)),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                //todo: 직접관리 페이지
              },
              child: Container(
                height: 47,
                child: Center(child: Text('직접관리', style: textStyle(color: Color(0xffff9933), weight: 500, size: 12.0))),
              )
            )
          ]
        )
      )
    );
  }

  bugReport() {
    navigatorPush(context: context, widget: SupportView(supportId: 0, title: shopJson['name']));
  }
}