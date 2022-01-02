import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/serviceViews/reviewView/reviewContainer.dart';

class ReviewView extends StatefulWidget {
  @override
  State<ReviewView> createState() => _ReviewView();
}
class _ReviewView extends State<ReviewView> {

  var _reviewList = [];

  @override
  void initState() {
    super.initState();
    _getReviewList();
  }

  _getReviewList() async {
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
    return Scaffold(
      appBar: DefaultAppBar(title: '내가 쓴 글'),
      backgroundColor: Color(0xfffcfcfc),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(_reviewList.length, (index) {
            return ReviewContainer(reviewItem: _reviewList[index],);
          })
        )
      )
    );
  }
}