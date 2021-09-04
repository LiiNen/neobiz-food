import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
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
      appBar: MainAppBar(),
      body: Column(
        children: [
          MainTitleBar(title: '역세권'),
          subwayRegionBuilder()

        ],
      )
    );
  }

  subwayRegionBuilder() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(subwayRegionList.length, (index) {
          return Container(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                navigatorPush(context: context, route: SubwayLineView(title: '역세권 | ${subwayRegionList[index]['name']}', titleIndex: subwayRegionList[index]['no']));
              },
              child: Center(
                child: Text(subwayRegionList[index]['name'])
              )
            )
          );
        }),
      )
    );
  }
}