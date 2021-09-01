import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/mainGridView/commonViewCollection/regionGridBuilder.dart';
import 'package:foodie/mainGridView/commonViewCollection/searchListBuilder.dart';
import 'package:foodie/mainGridView/subwayView/subwayView.dart';
import 'package:foodie/restApi/searchSubwayApi.dart';

class SubwayLineRegionView extends StatefulWidget {
  final String title;
  final int titleIndex;
  SubwayLineRegionView({required this.title, required this.titleIndex});
  @override
  State<SubwayLineRegionView> createState() => _SubwayLineRegionView(title: title, titleIndex: titleIndex);
}
class _SubwayLineRegionView extends State<SubwayLineRegionView> {
  String title;
  int titleIndex;
  _SubwayLineRegionView({required this.title, required this.titleIndex});

  var subwayLineRegionItemList = [];
  @override
  void initState() {
    super.initState();
    getSubwaySearchList();
  }
  getSubwaySearchList() async {
    var temp = await searchSubway(subwayQueryData: subwayQuery(lineNo: titleIndex), mode: 'region');
    subwayLineRegionItemList = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: (subwayLineRegionItemList.length == 0 ?
        [] :
        [
          MainTitleBar(title: title),
          RegionGridBuilder(regionList: subwayLineRegionItemList, isSubway: true, routerComponent: {'title': title})
        ]
      )
    );
  }
}