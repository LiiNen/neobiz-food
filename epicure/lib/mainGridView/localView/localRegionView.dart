import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/mainGridView/commonViewCollection/regionGridBuilder.dart';
import 'package:foodie/restApi/searchLocalApi.dart';
import 'localRegionSearchView.dart';

class LocalRegionView extends StatefulWidget {
  final String title;
  final int titleIndex;
  LocalRegionView({required this.title, required this.titleIndex});

  @override
  State<LocalRegionView> createState() => _LocalRegionView(title: title, titleIndex: titleIndex);
}
class _LocalRegionView extends State<LocalRegionView> {
  String title;
  int titleIndex;
  _LocalRegionView({required this.title, required this.titleIndex});

  var localRegionItemList = [];

  @override
  void initState() {
    super.initState();
    getRegion();
  }

  /// localRegionItemList : List
  /// localRegionItemList[index] : {no: int, name: String, count: int}
  getRegion() async {
    var temp = await searchLocal(doNum: titleIndex, siName: '', mode: 'region');
    localRegionItemList = temp;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
        children: <Widget>[
          MainTitleBar(title: title)
        ] + (localRegionItemList.length != 0
        ? [RegionGridBuilder(regionList: localRegionItemList, isLocal: true, routerComponent: {'title': title, 'titleIndex': titleIndex})]
        : [])
      )
    );
  }
}