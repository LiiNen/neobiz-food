import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/serviceViews/reviewView/reviewContainer.dart';
import 'package:foodie/shopView/shopViewReviewView.dart';

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
    _reviewList = [
      ReviewItem(userName: '김정훈', content: '리뷰 테스트', score: 5),
      ReviewItem(userName: '김정훈', content: '긴글 리뷰 테스트, 긴글 리뷰 테스트, 긴글 리뷰 테스트, 긴글 리뷰 테스트, 긴글 리뷰 테스트, 긴글 리뷰 테스트, 긴글 리뷰 테스트, 긴글 리뷰 테스트, 긴글 리뷰 테스트, 긴글 리뷰 테스트, 긴글 리뷰 테스트, 긴글 리뷰 테스트, 긴글 리뷰 테스트 긴글 리뷰 테스트 ', score: 5),
      ReviewItem(userName: '김정훈 긴 이름 테스트 긴 이름 테스트 긴 이름 테스트', content: '리뷰 테스트', score: 5),
      ReviewItem(userName: '김정훈', content: '리뷰 테스트', score: 4),
      ReviewItem(userName: '김정훈', content: '리뷰 테스트', score: 3),
      ReviewItem(userName: '김정훈', content: '리뷰 테스트', score: 2),
      ReviewItem(userName: '김정훈', content: '리뷰 테스트', score: 1),
      ReviewItem(userName: '김정훈', content: '리뷰 테스트', score: 5),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfffcfcfc),
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
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('이 식당이 마음에 드셨나요?', style: textStyle(weight: 500, size: 17.0)),
              SizedBox(height: 1),
              Text('리뷰를 작성하고 1000P를 받아보세요.', style: textStyle(color: Color(0xffff851c), weight: 500, size: 14.0))
            ]
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  //todo : pass with shop parameter
                  navigatorPush(context: context, widget: ShopViewReviewView(shopJson['shopId']));
                },
                child: Container(
                  width: 88, height: 33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                    border: Border.all(color: Color(0xffededed), width: 1),
                    boxShadow: [BoxShadow(
                      color: Color(0x4ebababa),
                      offset: Offset(0,3),
                      blurRadius: 6,
                      spreadRadius: 0
                    )],
                    color: Colors.white
                  ),
                  child: Center(child: Text('리뷰 작성', style: textStyle(weight: 700, size: 13.0)))
                )
              )
            )
          )
        ]
      )
    );
  }

  reviewBox() {
    return Column(
      children:  List.generate(_reviewList.length, (index) {
        return ReviewContainer(reviewItem: _reviewList[index],);
      })
    );
  }
}