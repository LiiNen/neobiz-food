import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/shopView/shopView.dart';

class ReviewContainer extends StatelessWidget {
  final dynamic reviewItem;
  ReviewContainer({required this.reviewItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if(reviewItem['shopId'] != -1) navigatorPush(context: context, widget: ShopView(shopNo: reviewItem['shopId'], infoText: 'genre'));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('asset/image/userProfileDefault.png', width: 44),
                      SizedBox(width: 9),
                      Expanded(child: Text(reviewItem['userName'], style: textStyle(weight: 500, size: 15.0), overflow: TextOverflow.ellipsis,)),
                      SizedBox(width: 9),
                      Image.asset('asset/image/review/select${reviewItem['starRating']}.png', width: 44),
                    ]
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(child: Text(reviewItem['content'], style: textStyle(weight: 400, size: 14.0))),
                      // todo with point position
                    ]
                  )
                ]
              )
            ),
            lineDivider(),
          ]
        )
      )
    );
  }
}