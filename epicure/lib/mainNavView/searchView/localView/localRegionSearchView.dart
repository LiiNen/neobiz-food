import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/mainGridView/commonViewCollection/searchListBuilder.dart';
import 'package:foodie/restApi/searchLocalApi.dart';
import 'package:foodie/mainGridView/commonViewCollection/searchFilters.dart';

class LocalRegionSearchView extends StatefulWidget {
  final String title;
  final int titleIndex;
  final String region;
  LocalRegionSearchView({required this.title, required this.titleIndex, required this.region});
  @override
  State<LocalRegionSearchView> createState() => _LocalRegionSearchView(title: title, titleIndex: titleIndex, region: region);
}
class _LocalRegionSearchView extends State<LocalRegionSearchView> {
  String title;
  int titleIndex;
  String region;
  _LocalRegionSearchView({required this.title, required this.titleIndex, required this.region});

  var localRegionSearchItemList = [];
  var _checkedRegion = [];
  var _checkedMenu = [];
  var _checkedTheme = [];
  var _filteredItemList = [];

  @override
  void initState() {
    super.initState();
    getLocalSearchList();
  }

  /// localRegionSearchItemList : List
  /// localRegionItemList[index]
  /// { name: String, rank: int, kind: String, food_2nd: String
  ///   photo: String(url), no: int, paid: n, y,
  ///   shop_1st: int,int,  shop_2nd: int,int
  ///   area 1st: int, area 2nd: int, area 3rd: int, theme: String }
  getLocalSearchList() async {
    var temp = await searchLocal(doNum: titleIndex, siName: region, mode: 'shop', curPage: 1, presetBody: presetRequestBody());
    localRegionSearchItemList = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
        children: <Widget> [
          MainTitleBar(title: title),
          localFilter(),
        ] + (localRegionSearchItemList.length != 0 ? (_filteredItemList.length != 0 ?
          [SearchListBuilder(searchList: _filteredItemList,)] : [SearchListBuilder(searchList: localRegionSearchItemList,)]) : []
        )
      ),
    );
  }

  localFilter() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          localFilterContainer('구역별', regionFilter),
          localFilterContainer('메뉴별', menuFilter),
          localFilterContainer('상황별', themeFilter),
        ],
      )
    );
  }
  localFilterContainer(String filterName, action) {
    return GestureDetector(
      onTap: () async {
        if(filterName == '구역별') _checkedRegion = await action(context, localRegionSearchItemList, _checkedRegion);
        if(filterName == '메뉴별') _checkedMenu = await action(context, localRegionSearchItemList, _checkedMenu);
        if(filterName == '상황별') _checkedTheme = await action(context, localRegionSearchItemList, _checkedTheme);
        setState(() {
          _filteredItemList = setFilteredItemList(localRegionSearchItemList, _checkedRegion, _checkedMenu, _checkedTheme);
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        width: 30, height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black)
        ),
        child: Center(child: Text(filterName))
      )
    );
  }
}