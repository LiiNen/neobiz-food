import 'package:flutter/material.dart';
import 'package:foodie/mainGridView/subwayView/subwayView.dart';
import 'package:foodie/restApi/searchSubwayApi.dart';

class SubwayLineContainer extends StatefulWidget {
  final int titleIndex;
  SubwayLineContainer({required this.titleIndex});

  @override
  State<SubwayLineContainer> createState() => _SubwayLineContainer(titleIndex: titleIndex);
}
class _SubwayLineContainer extends State<SubwayLineContainer> {
  int titleIndex;
  _SubwayLineContainer({required this.titleIndex});

  var subwayLineList = [];

  @override
  void initState() {
    super.initState();
    _getSubwayLine();
  }
  _getSubwayLine() async {
    var temp = await searchSubway(subwayQueryData: subwayQuery(areaNo: titleIndex), mode: 'region');
    subwayLineList = temp;
    setState(() {
      print('setstate ok');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: subwayLineList.length == 0 ? Row(
        children: [
          subwayLineBuilder(),
          Expanded(child: Text('hello'))
        ],
      ) : Container()
    );
  }

  subwayLineBuilder() {
    var _subwayLineContainerList = List.generate(subwayLineList.length, (index) {
      return Container(
        child: Text(subwayLineList[index]['name'])
      );
    });

    return Container(
      width: 200,
      child: ListView(
        shrinkWrap: true,
        children: _subwayLineContainerList
      )
    );
  }
}