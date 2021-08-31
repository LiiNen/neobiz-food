import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
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
        children: [
          MainTitleBar(title: title),
          localRegionItemBuilder()
        ],
      )
    );
  }

  localRegionItemBuilder() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3,
        children: List.generate(localRegionItemList.length, (index) {
          return Container(
            child: Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      print(localRegionItemList[index]);
                      navigatorPush(context: context, route: LocalRegionSearchView(title: '$title ${localRegionItemList[index]['name']}', titleIndex: titleIndex, region: localRegionItemList[index]['name']));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(localRegionItemList[index]['name']),
                        Text(localRegionItemList[index]['count'].toString())
                      ]
                    )
                  )
                )
              ]
            )
          );
        })
      ),
    );
  }
}