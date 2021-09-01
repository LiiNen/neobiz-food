import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/mainGridView/subwayView/subwayLineRegionView.dart';
import 'package:foodie/restApi/searchSubwayApi.dart';

import 'subwayView.dart';


class SubwayLineView extends StatefulWidget {
  final String title;
  final int titleIndex;
  SubwayLineView({required this.title, required this.titleIndex});
  @override
  State<SubwayLineView> createState() => _SubwayLineView(title: title, titleIndex: titleIndex);
}
class _SubwayLineView extends State<SubwayLineView> {
  String title;
  int titleIndex;
  _SubwayLineView({required this.title, required this.titleIndex});

  var subwayLineList = [];

  bool _isSelected = false;
  String _selectedTitle = '';
  int _selectedTitleIndex = -1;

  @override
  void initState() {
    super.initState();
    getSubwayLine();
  }

  getSubwayLine() async {
    var temp = await searchSubway(subwayQueryData: subwayQuery(areaNo: titleIndex), mode: 'region');
    subwayLineList = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
        children: <Widget>[
          MainTitleBar(title: title),
          subwayLineBuilder(),
        ] + [Expanded(
          child: _isSelected
            ? SubwayLineRegionView(title: _selectedTitle, titleIndex: _selectedTitleIndex, areaNo: titleIndex)
            : Center(child: Text('select one'))
        )],
      )
    );
  }

  subwayLineBuilder() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 5,
        children: List.generate(subwayLineList.length, (index) {
          return Container(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  _isSelected = true;
                  _selectedTitle = subwayLineList[index]['name'];
                  _selectedTitleIndex = subwayLineList[index]['no'];
                });
              },
              child: Center(
                child: Text(subwayLineList[index]['name'])
              )
            )
          );
        }),
      )
    );
  }
}