import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';

class RecShopContainerList extends StatelessWidget {
  final recShopList;
  RecShopContainerList(this.recShopList);

  @override
  Widget build(BuildContext context) {
    bool hasBottomSpace = false;
    var recRowList = List<Widget>.generate(recShopList.length, (index) {
      if(index%2 == 1) {
        hasBottomSpace = true;
        return SizedBox(height: 41);
      }
      hasBottomSpace = false;
      return Row(
        children: [
          recShopContainer(recShopList[index]),
          SizedBox(width: 16),
          recShopContainer(index+1 < recShopList.length ? recShopList[index+1] : null),
        ]
      );
    });
    if(!hasBottomSpace) recRowList.add(SizedBox(height: 41));

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: recRowList
      )
    );
  }

  recShopContainer(dynamic recShop) {
    return Expanded(
      child: recShop != null ? GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // todo: push detail view
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$recShop', style: textStyle(weight: 500, size: 15.0))
                ]
              )
            ]
          )
        )
      ) : Container(),
    );
  }
}