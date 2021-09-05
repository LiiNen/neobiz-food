import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodie/collections/functions.dart';

import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/mainGridView/commonViewCollection/detailView.dart';
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

  /// scrapItemList : List
  /// scrapItemList[index] : {no: int, name: String, rank: int, photo: String,
  getScrap() async {
    var temp = await searchScrap(type: 'show', page: 1, presetBody: presetRequestBody());
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
    print(scrapItemList.length);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: scrapItemList.length,
      itemBuilder: (context, index) {
        var item = scrapItemList[index];
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
                shareLink(context, item['name']);
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
            behavior: HitTestBehavior.translucent,
            onTap: () {
              print(item['no']);
              navigatorPush(context: context, route: DetailView(no: int.parse(item['no'])));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (
                          item['photo'] is String ?
                          Image.network(
                            item['photo'], width: 40, height: 40,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return FlutterLogo(size: 40);
                            }
                          ) : FlutterLogo(size: 40)
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