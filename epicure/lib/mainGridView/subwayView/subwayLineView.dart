import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessWidgets.dart';

class SubwayLineView extends StatefulWidget {
  final String title;
  SubwayLineView({required this.title});
  @override
  State<SubwayLineView> createState() => _SubwayLineView(title: title);
}
class _SubwayLineView extends State<SubwayLineView> {
  String title;
  _SubwayLineView({required this.title});

  var subwayLineList = [];

  @override
  void initState() {
    super.initState();
    getSubwayLine();
  }

  getSubwayLine() async {
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
        ],
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

              },
              child: Center(

              )
            )
          );
        }),
      )
    );
  }
}