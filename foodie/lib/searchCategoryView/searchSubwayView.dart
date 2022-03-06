import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainNavView/searchView/searchResultView.dart';
import 'package:foodie/restApi/regionApi.dart';

Map subwayQuery({int areaNo=-1, int lineNo=-1, int stationNo=-1, int curPage=-1}) {
  return {
    'areaNo': areaNo,
    'lineNo': lineNo,
    'stationNo': stationNo,
    'curPage': curPage,
  };
}

class SearchSubwayView extends StatefulWidget {
  @override
  State<SearchSubwayView> createState() => _SearchSubwayView();
}
class _SearchSubwayView extends State<SearchSubwayView> {
  var _selectedIndex;
  bool _isExpanded = false;

  var _subwayRegionList = [];
  var _subwayLineList = [];
  var _subwayStationList = [];

  int _selectedRegion = 0;
  int _selectedLine = -1;
  int _selectedStation = 0;

  @override
  void initState() {
    super.initState();
    _getSubway();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        subwayRegionContainer(),
        lineDivider(),
        subwayDetailContainer()
      ]
    );
  }

  _getSubway() async {
    var temp = await getRegionSubway();
    setState(() {
      _subwayRegionList = temp;
    });
  }
  _getSubwayLine() async {
    var temp = await getRegionSubwayProvince(_subwayRegionList[_selectedRegion]['provinceName']);
    setState(() {
      _subwayLineList = temp;
    });
  }
  _getSubwayStation() async {
    var temp = await getRegionSubwayProvinceDistrict(_subwayRegionList[_selectedRegion]['provinceName'], _subwayLineList[_selectedLine]['districtName']);
    setState(() {
      _subwayStationList = temp;
    });
  }

  onTapExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  subwayRegionContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xfff8f8f8),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 18),
            child: Column(
              children: _isExpanded ? List.generate((_subwayRegionList.length / 5).ceil() * 2 - 1, (index) {
                if(index%2==1) {
                  return SizedBox(height: 11);
                }
                return subwayListRow((index/2).floor());
              }) : [subwayListRow(0)]
            )
          ),
          bottomTapButton(context, onTapExpanded)
        ]
      )
    );
  }

  subwayListRow(int startIndex) {
    int _index = startIndex * 5;
    return Row(
      children: List.generate(9, (rowIndex) {
        if(rowIndex%2==1) return SizedBox(width: 10);
        else return subwaySquareBox(_index + (rowIndex/2).floor());
      })
    );
  }
  subwaySquareBox(int index) {
    var _selected = _selectedIndex == index;
    if(index >= _subwayRegionList.length) {
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
            _subwayLineList = [];
            _subwayStationList = [];
            _selectedLine = -1;
            _selectedStation = 0;
            _selectedRegion = index;
            _getSubwayLine();
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
              child: Text(_subwayRegionList[index]['provinceName'], style: _selected ?
                textStyle(color: Colors.white, weight: 700, size: 14.0) :
                textStyle(weight: 500, size: 14.0)
              ),
            )
          )
        )
      )
    );
  }

  subwayDetailContainer() {
    return Expanded(child:
      Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 114),
              Expanded(child: SingleChildScrollView(
                child: subwayStationContainer()
              ))
            ]
          ),
          Container(
            width: 114,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: const Color(0x19000000),
                offset: Offset(0, 0),
                blurRadius: 6,
                spreadRadius: 0
              )] ,
              color: const Color(0xffffffff)
            ),
            child: SingleChildScrollView(
              child: subwayLineContainer()
            )
          ),
        ]
    ));
  }

  subwayLineContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.5),
      child: Column(
        children: List.generate(_subwayLineList.length == 0 ? 0 : _subwayLineList.length * 2 - 1, (index) {
          if(index%2==1) return lineDivider();
          var itemIndex = (index/2).floor();
          bool _selected = _selectedLine == itemIndex;
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _selectedLine = itemIndex;
              _getSubwayStation();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 17),
              height: 22,
              child: Stack(
                children: [
                  Center(
                    child: Text(_subwayLineList[itemIndex]['districtName'], style: textStyle(weight: 500, size: 15.0))
                  ),
                  _selected ? Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 9, height: 9,
                      margin: EdgeInsets.only(left: 9),
                      color: serviceColor(),
                    )
                  ) : Container()
                ]
              )
            )
          );
        })
      )
    );
  }

  subwayStationContainer() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: List.generate(_subwayStationList.length * 2, (index) {
          if(index%2==1) return lineDivider();
          var itemIndex = (index/2).floor();
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _selectedStation = _subwayStationList[itemIndex]['regionId'];

              //todo: navigator push with id
              navigatorPush(context: context, widget: SearchResultView(title: '${_subwayStationList[itemIndex]['subwayName']}역', searchType: 'subway', requestItem: null, regionId: _selectedStation));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 17),
              padding: EdgeInsets.only(left: 11, right: 7),
              height: 22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_subwayStationList[itemIndex]['subwayName'], style: textStyle(weight: 500, size: 15.0)),
                  Text(_subwayStationList[itemIndex]['districtCount'].toString(), style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 15.0)),
                ]
              )
            )
          );
        })
      )
    );
  }
}