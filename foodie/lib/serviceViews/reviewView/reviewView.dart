import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/main.dart';
import 'package:foodie/restApi/reviewApi.dart';
import 'package:foodie/serviceViews/reviewView/reviewContainer.dart';

class ReviewView extends StatefulWidget {
  final int id;
  final bool isUser;
  ReviewView({required this.id, required this.isUser});
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
    var _temp = widget.isUser ? await getReviewUser(userId: widget.id) : await getReviewShop(shopId: widget.id);
    if(_temp != null) {
      setState(() {
        _reviewList = List.generate(_temp.length, (index) {
          return ReviewItem(userName: _temp[index]['name'], content: _temp[index]['content'], score: int.parse(_temp[index]['starRating']), shopId: _temp[index]['shopId']);
        });
      });
    }
    else {
      showToast('네트워크 에러');
    }
  }

  _setReviewList() {

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