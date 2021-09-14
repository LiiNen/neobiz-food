import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/mainGridView/subwayView/subwayLineContainer.dart';
import 'package:foodie/mainGridView/subwayView/subwayLineView.dart';
import 'package:foodie/restApi/searchSubwayApi.dart';

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
  var subwayRegionList = [];
  bool _isSelected = false;
  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    getSubway();
  }

  /// subwayRegionList : List
  /// subwayRegionList[index] : {no: int, name: String, count: int}
  getSubway() async {
    var temp = await searchSubway(subwayQueryData: subwayQuery(), mode: 'region');
    subwayRegionList = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MainTitleBar(title: '역세권'),
          subwayBuilder(),
        ] + (_isSelected ? [SubwayLineContainer(titleIndex: _selectedIndex)] : []),
      )
    );
  }

  subwayBuilder() {
    return Container(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: List.generate(subwayRegionList.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 80,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                /// todo: add components to behind it, not to nav push
                setState(() {
                  _isSelected = true;
                  _selectedIndex = subwayRegionList[index]['no'];
                });
                // navigatorPush(context: context, route: SubwayLineView(title: '역세권 | ${subwayRegionList[index]['name']}', titleIndex: subwayRegionList[index]['no']));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(subwayRegionList[index]['name'])
                )
              )
            )
          );
        })
      )
    );
  }
}