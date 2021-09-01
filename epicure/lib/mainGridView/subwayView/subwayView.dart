import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/restApi/searchSubwayApi.dart';

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
    var temp = await searchSubway(mode: 'region');
    subwayRegionList = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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