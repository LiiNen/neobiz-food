import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
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
    getSearchList();
  }

  /// localRegionSearchItemList : List
  /// localRegionItemList[index]
  /// { name: String, rank: int, kind: String, food_2nd: String
  ///   photo: String(url), no: int, paid: n, y,
  ///   shop_1st: int,int,  shop_2nd: int,int
  ///   area 1st: int, area 2nd: int, area 3rd: int, theme: String }
  getSearchList() async {
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
        ] + (localRegionSearchItemList.length != 0 ? [localRegionSearchObjectBuilder()] : []),
      )
    );
  }

  localRegionSearchObjectBuilder() {
    return Expanded(child: ListView.builder(
      shrinkWrap: true,
      itemCount: localRegionSearchItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return localRegionSearchObject(localRegionSearchItemList[index]);
      },
    ));
  }
  
  localRegionSearchObject(item) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print(item['name']);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (
                  item['photo'] is String ?
                  Image.network(item['photo'], width: 40, height: 40,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return FlutterLogo(size: 40);
                  }) : FlutterLogo(size: 40)
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item['name']),
                    Text('${item['kind']} | ${item['food_2nd']}'),
                  ]
                )
              ]
            ),
            Icon(Icons.arrow_forward_outlined, size: 40)
          ]
        )
      )
    );
  }
}