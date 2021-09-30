import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';

class ShopViewTabReview extends StatefulWidget {
  final dynamic shopJson;
  ShopViewTabReview(this.shopJson);

  @override
  State<ShopViewTabReview> createState() => _ShopViewTabReview(shopJson);
}
class _ShopViewTabReview extends State<ShopViewTabReview> {
  dynamic shopJson;
  _ShopViewTabReview(this.shopJson);

  var _reviewList = [];

  @override
  void initState() {
    super.initState();
    _getReview();
  }

  _getReview() async {
    // todo: get review from server
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          overViewBox(),
          spaceDivider(),
          reviewBox()
        ]
      )
    );
  }

  overViewBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('총 1개의 리뷰'),

            ]
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 79, height: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(4)
                  ),
                  color: const Color(0xffededed)
                ),
                child: Center(child: Text('리뷰 작성'))
              )
            )
          )
        ]
      )
    );
  }

  reviewBox() {
    var reviewChildren = List<Widget>.generate(10, (index) {
      return reviewBoxItem();
    });
    return Column(
      children: reviewChildren
    );
  }

  reviewBoxItem() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20, left: 18, right: 18),
      child: Column(
        children: [
          Container(
            height: 34,
            child: Row(
              children: [
                Text('이름')
              ]
            )
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 2),
            child: Text('리뷰 내용dkdkdkdkdkdkkdkdkdkkdkdkdkdkkd')
          )
        ]
      )
    );
  }
}