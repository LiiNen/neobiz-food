import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';

List<String> localTitleList = [
  '서울', '경기', '인천', '부산',
  '대구', '대전', '광주', '울산',
  '강원', '충북', '충남', '경북',
  '경남', '전북', '전남', '제주'];
List<String> localFullTitleList = [
  '서울특별시', '경기도', '인천광역시', '부산광역시',
  '대구광역시', '대전광역시', '광주광역시', '울산광역시',
  '강원도', '충청북도', '충청남도', '경상북도',
  '경상남도', '전라북도', '전라남도', '제주도'];

class SearchLocalView extends StatefulWidget {
  @override
  State<SearchLocalView> createState() => _SearchLocalView();
}
class _SearchLocalView extends State<SearchLocalView> {
  var _selectedIndex;
  var _localRegionList = [];

  _getRegion() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '지역별'),
      body: Container(
        margin: EdgeInsets.only(top: 11),
        child: Row(
          children: [
            localLeftItem(),
            localRightItem()
          ]
        )
      )
    );
  }

  localLeftItem() {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 16),
      width: 69,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: localTitleList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                _selectedIndex = index;
                _localRegionList = [];
                _getRegion();
              });
            },
            child: Container(
              height: 50,
              child: Center(
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(17.5)),
                      color: _selectedIndex == index ? serviceColor() : Colors.transparent
                  ),
                  child: Center(
                    child: Text(localTitleList[index], style: textStyle(color: _selectedIndex == index ? Colors.white : Color(0xff898989), weight: 500, size: 16.0))
                  )
                )

              )
            )
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
      )
    );
  }
  localRightItem() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 13, right: 18),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: _localRegionList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                //todo: navigatorPush
              },
              child: Container(
                height: 50,
              )
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
        )
      )
    );
  }
}