import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/mainGridView/commonViewCollection/searchListBuilder.dart';
import 'package:foodie/restApi/searchSubwayApi.dart';

class SubwayLineRegionSearchView extends StatefulWidget {
  final String title;
  final Map subwayQuery;
  SubwayLineRegionSearchView({required this.title, required this.subwayQuery});
  @override
  State<SubwayLineRegionSearchView> createState() => _SubwayLineRegionSearchView(title: title, subwayQuery: subwayQuery);
}
class _SubwayLineRegionSearchView extends State<SubwayLineRegionSearchView> {
  String title;
  Map subwayQuery;
  _SubwayLineRegionSearchView({required this.title, required this.subwayQuery});

  var subwaySearchItemList = [];

  @override
  void initState() {
    super.initState();
    getSubwaySearchList();
  }

  getSubwaySearchList() async {
    var temp = await searchSubway(subwayQueryData: subwayQuery, mode: 'shop', presetBody: presetRequestBody());
    subwaySearchItemList = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
        children: <Widget>[
          MainTitleBar(title: title),
        ] + (subwaySearchItemList.length != 0 ? [SearchListBuilder(searchList: subwaySearchItemList,)] : []),
      )
    );
  }
}