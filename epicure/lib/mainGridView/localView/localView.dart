import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/mainGridView/localView/localRegionView.dart';
import 'package:foodie/restApi/searchLocalApi.dart';
import 'package:foodie/collections/functions.dart';

import 'localRegionSearchView.dart';

class LocalItem {
  String title;
  String fullTitle;
  List<String>? childTitleList;
  LocalItem({required this.title, required this.fullTitle, this.childTitleList});
}

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

List<LocalItem> localItemList = List.generate(localTitleList.length, (index) {
  return LocalItem(title: localTitleList[index], fullTitle: localFullTitleList[index]);
});


class LocalView extends StatefulWidget {
  @override
  State<LocalView> createState() => _LocalView();
}
class _LocalView extends State<LocalView> {
  var _selectedIndex = -1;
  var _lineNum = 5;

  var _localRegionList = [];

  _getRegion() async {
    var temp = await searchLocal(doNum: _selectedIndex, siName: '', mode: 'region');
    setState(() {
      _localRegionList = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: <Widget>[
          localBuilder(),
          localRegionBuilder()
        ],
      )
    );
  }

  localBuilder() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: localColumnBuilder()
      )
    );
  }
  localColumnBuilder() {
    var _columnLength = (localItemList.length / _lineNum).ceil();
    List<int> _startIndexList = [];
    for(var i = 0; i < _columnLength; i++) {
      _startIndexList.add(i*_lineNum);
    }
    List<Widget> _rowBuilderList = List.generate(_startIndexList.length * 2 - 1, (index) {
      if(index%2 == 0) return localRowBuilder(_startIndexList[(index/2).floor()]);
      else return SizedBox(height: 8);
    });

    return Column(
      children: _rowBuilderList
    );
  }
  localRowBuilder(int startIndex) {
    List<Widget> _elementBuilderList = List.generate(_lineNum * 2 - 1, (index) {
      if(index%2 == 0) return localElementBuilder(startIndex + (index/2).floor());
      else return SizedBox(width: 8);
    });

    return Expanded(child: Row(
      children: _elementBuilderList
    ));
  }
  localElementBuilder(int index) {
    return Expanded(child: localItemList.length > index ? Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        color: Colors.white
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {
            _selectedIndex = index;
            _localRegionList = [];
            _getRegion();
          });
        },
        child: Center(
          child: Text(localItemList[index].title)
        )
      )
    ) : Container());
  }

  localRegionBuilder() {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: _localRegionList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              navigatorPush(context: context, route: LocalRegionSearchView(title: '${localItemList[_selectedIndex].fullTitle} ${_localRegionList[index]['name']}', titleIndex: _selectedIndex, region: _localRegionList[index]['name']));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_localRegionList[index]['name']),
                  Row(
                    children: [
                      Text(_localRegionList[index]['count'].toString()),
                      FlutterLogo(size: 10)
                    ]
                  )
                ]
              )
            )
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
      )
    );
  }
}