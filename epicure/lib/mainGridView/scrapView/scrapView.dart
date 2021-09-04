import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodie/collections/functions.dart';

import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/restApi/searchScrapApi.dart';

class ScrapView extends StatefulWidget {
  @override
  State<ScrapView> createState() => _ScrapView();
}
class _ScrapView extends State<ScrapView> {
  var scrapItemList = [];

  @override
  void initState() {
    super.initState();
    getScrap();
  }

  getScrap() async {
    // TODO :  Failure
    var temp = await searchScrap(type: 'show', no: -1, page: 1);
    scrapItemList = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
        children: [
          MainTitleBar(title: '찜한 맛집'),
          scrapBuilder()
        ],
      )
    );
  }

  scrapBuilder() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: scrapItemList.length,
      itemBuilder: (context, index) {
        return Slidable(
            key: UniqueKey(),
            direction: Axis.horizontal,
            dismissal: SlidableDismissal(
              child: SlidableDrawerDismissal(),
              onDismissed: (actionType) {
                setState(() {removeScrap(index);});
              },
            ),
            actionPane: SlidableScrollActionPane(),
            actionExtentRatio: 0.2,
            secondaryActions: [
              IconSlideAction(
                color: Colors.yellow,
                onTap: () {
                  // TODO : 공유하기 만들기
                },
                iconWidget: Container(
                  child: Text('공유', style: textStyle(color: Colors.white, weight: 400, size: 12.0))
                ),
              ),
              IconSlideAction(
                color: Colors.yellow,
                onTap: () {setState(() {removeScrap(index);});},
                iconWidget: Container(
                  child: Text('지우기', style: textStyle(color: Colors.white, weight: 400, size: 12.0))
                ),
              )
            ],
            child: GestureDetector(

          )
        );
      }
    );
  }

  removeScrap(index) {
    scrapItemList.removeAt(index);
    searchScrap(type: 'delete', no: -1, page: 1);
  }
}