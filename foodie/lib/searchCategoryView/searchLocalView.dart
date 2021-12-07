import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainNavView/searchView/searchResultView.dart';
import 'package:foodie/restApi/searchLocalApi.dart';

List<String> localTitleList = [
  '서울', '경기', '인천', '부산', '대구',
  '대전', '광주', '울산', '강원', '충북',
  '충남', '경북', '경남', '전북', '전남', '제주'];
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
  bool _isExpanded = false;

  _getRegion() async {
    var temp = await searchLocal(doNum: _selectedIndex, siName: '', mode: 'region');
    setState(() {
      _localRegionList = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        localRegionContainer(),
        Expanded(child: SingleChildScrollView(
          child: localDetailContainer(),
        ))
      ]
    );
  }

  localRegionContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 18),
            child: Column(
              children: _isExpanded ? List.generate((localTitleList.length / 5).ceil() * 2 - 1, (index) {
                if(index%2==1) {
                  return SizedBox(height: 11);
                }
                return localListRow((index/2).floor());
              }) : [localListRow(0)]
            )
          ),
          bottomTapButton(context, onTapExpanded)
        ]
      )
    );
  }

  onTapExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  localListRow(int startIndex) {
    int _index = startIndex * 5;
    return Row(
      children: List.generate(9, (rowIndex) {
        if(rowIndex%2==1) return SizedBox(width: 10);
        else return localSquareBox(_index + (rowIndex/2).floor());
      })
    );
  }

  localSquareBox(int index) {
    var _selected = _selectedIndex == index;
    if(index >= localTitleList.length) {
      return Expanded(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              boxShadow: [BoxShadow(
                color: Color(0x45dbdbdb),
                offset: Offset(3,3),
                blurRadius: 5,
                spreadRadius: 0
              )] ,
              color: Colors.white
            )
          )
        )
      );
    }
    else return Expanded(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _selectedIndex = index;
            _localRegionList = [];
            _getRegion();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              boxShadow: [BoxShadow(
                color: Color(0x45dbdbdb),
                offset: Offset(3,3),
                blurRadius: 5,
                spreadRadius: 0
              )] ,
              color: _selected ? serviceColor() : Colors.white,
            ),
            child: Center(
              child: Text(localTitleList[index], style: _selected ?
                textStyle(color: Colors.white, weight: 700, size: 14.0) :
                textStyle(weight: 500, size: 14.0)
              ),
            )
          )
        )
      )
    );
  }

  localDetailContainer() {
    return Container(
      child: Column(
        children: List.generate(_localRegionList.length, (index) {
          return localDetailBox(index);
        })
      )
    );
  }

  localDetailBox(index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          lineDivider(),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              navigatorPush(
                context: context,
                widget: SearchResultView(
                  title: '${localFullTitleList[_selectedIndex]} ${_localRegionList[index]['name']}',
                  searchType: 'local',
                  requestItem: {'doNum': _selectedIndex, 'siName': _localRegionList[index]['name']},
                )
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_localRegionList[index]['name'], style: textStyle(weight: 500, size: 15.0)),
                  Text(_localRegionList[index]['count'].toString(), style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 15.0))
                ]
              )
            )
          )
        ]
      )
    );
  }
}