import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainGridView/commonViewCollection/searchListBuilder.dart';
import 'package:foodie/mainNavView/searchView/searchResultAppBar.dart';
import 'package:foodie/restApi/searchTownApi.dart';

class TownSearchView extends StatefulWidget {
  final String title;
  final int titleIndex;
  TownSearchView({required this.title, required this.titleIndex});
  @override
  State<TownSearchView> createState() => _TownSearchView(title: title, titleIndex: titleIndex);
}
class _TownSearchView extends State<TownSearchView> {
  String title;
  int titleIndex;
  _TownSearchView({required this.title, required this.titleIndex});

  var townSearchItemList = [];

  @override
  void initState() {
    super.initState();
    getTownSearchList();
  }

  getTownSearchList() async {
    var temp = await searchTown(townNo: titleIndex, mode: 'shop', presetBody: presetRequestBody());
    townSearchItemList = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchResultAppBar(title: title),
      body: Column(
        children: <Widget>[
        ] + (townSearchItemList.length != 0 ? [SearchListBuilder(searchList: townSearchItemList,)] : [])
      )
    );
  }
}