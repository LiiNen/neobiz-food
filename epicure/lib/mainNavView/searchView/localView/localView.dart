import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  var _lineNum = 6;
  var _sum = 0;
  var _localRegionList = [];

  _getRegion() async {
    var temp = await searchLocal(doNum: _selectedIndex, siName: '', mode: 'region');
    var tempSum = 0;
    for(var i = 0; i < temp.length; i++) {
      tempSum = tempSum + temp[i]['count'] as int;
    }
    setState(() {
      _localRegionList = temp;
      _sum = tempSum;
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
      // TODO: HACK: with caculation
      height: (MediaQuery.of(context).size.width-20-(_lineNum-1)*8)/6*3+48,
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
    return Expanded(child: localItemList.length > index ? GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          _selectedIndex = index;
          _localRegionList = [];
          _getRegion();
        });
      },
      child: buildSquare(isSelected: _selectedIndex == index, title: localItemList[index].title)
    ) : Container());
  }

  localRegionBuilder() {
    if(_localRegionList.length == 0) return Container();
    else return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: _localRegionList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if(index==0) print('all');
              else navigatorPush(context: context, route: LocalRegionSearchView(title: '${localItemList[_selectedIndex].fullTitle} ${_localRegionList[index-1]['name']}', titleIndex: _selectedIndex, region: _localRegionList[index-1]['name']));
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
                  index==0 ? Text('전체') : Text(_localRegionList[index-1]['name']),
                  Row(
                    children: [
                      Text(threeDigit(index==0 ? _sum : _localRegionList[index-1]['count'])),
                      SizedBox(width: 8.75),
                      SvgPicture.asset('asset/svgIcon/icoNext.svg', width: 4.5, height: 9)
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