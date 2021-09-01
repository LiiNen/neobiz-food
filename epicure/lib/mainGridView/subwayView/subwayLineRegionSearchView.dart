import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessWidgets.dart';

class SubwayLineRegionSearchView extends StatefulWidget {
  final String title;
  final int titleIndex;
  SubwayLineRegionSearchView({required this.title, required this.titleIndex});
  @override
  State<SubwayLineRegionSearchView> createState() => _SubwayLineRegionSearchView(title: title, titleIndex: titleIndex);
}
class _SubwayLineRegionSearchView extends State<SubwayLineRegionSearchView> {
  String title;
  int titleIndex;
  _SubwayLineRegionSearchView({required this.title, required this.titleIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
        children: <Widget>[
          MainTitleBar(title: title),
          Text(titleIndex.toString())
        ],
      )
    );
  }
}