import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/restApi/searchSubwayApi.dart';
import 'subwayLineRegionSearchView.dart';

Map subwayQuery({int areaNo=-1, int lineNo=-1, int stationNo=-1, int curPage=-1}) {
  return {
    'areaNo': areaNo,
    'lineNo': lineNo,
    'stationNo': stationNo,
    'curPage': curPage,
  };
}

class SubwayView extends StatefulWidget {
  @override
  State<SubwayView> createState() => _SubwayView();
}
class _SubwayView extends State<SubwayView> {
  var _subwayList = [];
  var _subwayLineList = [];
  var _subwayLineRegionList = [];
  bool _isSelected = false;
  int _selectedIndex = -1;
  bool _isLineSelected = false;
  int _lineSelectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _getSubway();
  }

  _getSubway() async {
    var temp = await searchSubway(subwayQueryData: subwayQuery(), mode: 'region');
    setState(() {
      _subwayList = temp;
    });
  }
  _getSubwayLine() async {
    var temp = await searchSubway(subwayQueryData: subwayQuery(areaNo: _selectedIndex), mode: 'region');
    setState(() {
      _subwayLineList = temp;
    });
  }
  _getSubwayRegionList() async {
    var temp = await searchSubway(subwayQueryData: subwayQuery(lineNo: _lineSelectedIndex), mode: 'region');
    _subwayLineRegionList = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          subwayBuilder(),
        ] + (_isSelected ? [subwayLineBuilder()] : []),
      )
    );
  }

  subwayBuilder() {
    return Container(
      color: Color(0xffF3F3F3),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: _subwayList.length != 0 ? List.generate(_subwayList.length * 2 - 1, (index) {
          int _listIndex = (index/2).floor();
          if(index%2 == 0) {
            var _temp = _subwayList[_listIndex];
            return Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    _isSelected = true;
                    _selectedIndex = _subwayList[_listIndex]['no'];
                    _isLineSelected = false;
                    _lineSelectedIndex = -1;

                    _subwayLineList = [];
                    _subwayLineRegionList = [];
                    _getSubwayLine();
                  });
                },
                child: buildSquare(isSelected: _selectedIndex == _temp['no'], title: _temp['name'],)
              )
            );
          }
          else return SizedBox(width: 8);
        }) : []
      )
    );
  }

  subwayLineBuilder() {
    return Expanded(child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 128,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: _subwayLineList.length,
            itemBuilder: (BuildContext context, int index) {
              bool _condition = _subwayLineList[index]['no'] == _lineSelectedIndex;
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    _isLineSelected = true;
                    _lineSelectedIndex = _subwayLineList[index]['no'];

                    _subwayLineRegionList = [];
                    _getSubwayRegionList();
                  });
                },
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: _condition ? Colors.white : Color(0xffF1F1F1)
                  ),
                  child: Center(
                    child: Text(_subwayLineList[index]['name'], style: textStyle(color: _condition ? Color(0xff242424) : Color(0xffAEAEAE)))
                  )
                )
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 1, color: Color(0xffE1E1E1)),
          )
        )
      ] + (_isLineSelected ? [subwayLineDetailBuilder()] : [])
    ));
  }

  subwayLineDetailBuilder() {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24),
        shrinkWrap: true,
        itemCount: _subwayLineRegionList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              navigatorPush(context: context, route: SubwayLineRegionSearchView(title: '${_subwayLineRegionList[index]['name']}역 주변 맛집', subwayQuery: subwayQuery(areaNo: _selectedIndex, lineNo: _lineSelectedIndex, stationNo: _subwayLineRegionList[index]['no'])));
            },
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_subwayLineRegionList[index]['name']),
                  Row(
                    children: [
                      Text(_subwayLineRegionList[index]['count'].toString()),
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