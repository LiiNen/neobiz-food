import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/mainGridView/commonViewCollection/searchListBuilder.dart';
import 'package:foodie/restApi/searchLocalApi.dart';

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
        ] + (localRegionSearchItemList.length != 0 ? [SearchListBuilder(searchList: localRegionSearchItemList,)] : []),
      )
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
      onTap: () {
        action(localRegionSearchItemList);
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

  regionFilter(List targetList) {

  }

  List<String> menuFilterList = ['한식', '중식', '일식', '양식', '에스닉', '퓨전', '뷔페', '디저트', '펍&바'];
  List<int> checkedMenu = [];

  menuFilter(List targetList) async {
    print(targetList.length);
    return (await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              content: Center(child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 18),
                height: 400,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(menuFilterList.length, (index) {
                    return Container(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          print(index);
                          print(checkedMenu);
                          setState(() {
                            print(checkedMenu.indexOf(index));
                            checkedMenu.indexOf(index) != -1 ? checkedMenu.remove(index) : checkedMenu.add(index);
                            print(checkedMenu);
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(menuFilterList[index]),
                            Icon(checkedMenu.indexOf(index) != -1 ? Icons.radio_button_checked : Icons.radio_button_off)
                          ]
                        )
                      ),
                    );
                  }),
                )
              ))
            );
          }
        );
      }
    )) ?? false;
  }
  menuFilterDialog() {

  }
  themeFilter(List targetList) {

  }
}