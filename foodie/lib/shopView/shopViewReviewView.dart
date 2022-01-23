import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/main.dart';
import 'package:foodie/restApi/reviewApi.dart';

class ShopViewReviewView extends StatefulWidget {
  final int shopId;
  ShopViewReviewView(this.shopId);
  @override
  State<ShopViewReviewView> createState() => _ShopViewReviewView(); 
}
class _ShopViewReviewView extends State<ShopViewReviewView> {
  int selectedIndex = -1;
  List<String> reviewScoreTitleList = ['탁월', '감동', '좋음', '평범', '실망'];

  TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: DefaultAppBar(title: '리뷰작성'),
        backgroundColor: Color(0xfffcfcfc),
        body: SingleChildScrollView(
          child: Column(
            children: [
              reviewScoreBox(),
              spaceDivider(),
              reviewTextBox(),
            ]
          )
        ),
        bottomNavigationBar: bottomNavigationButton(title: '확인', action: submitReview),
      )
    );
  }

  reviewScoreBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 26, right: 26, top: 32, bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(5, (index) {
          return reviewScore(index);
        })
      )
    );
  }

  reviewScore(int index) {
    bool _isSelected = index == selectedIndex;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          _isSelected ?
            Image.asset('asset/image/review/select${5-index}.png', width: 50) :
            Image.asset('asset/image/review/unselect${5-index}.png', width: 50),
          SizedBox(height: 10),
          Text(reviewScoreTitleList[index], style: textStyle(color: _isSelected ? serviceColor() : Color(0xff898989), weight: 500, size: 15.0)),
          SizedBox(height: 14),
          Container(
            width: 45, height: 22,
            decoration: _isSelected ? BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: serviceColor(),
            ) : BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              border: Border.all(color: Color(0xffff7c2f), width: 1)
            ),
            child: Center(
              child: Text('${5-index}.0', style: textStyle(color: _isSelected ? Colors.white : serviceColor(), weight: 400, size: 14.0))
            )
          ),
        ]
      )
    );
  }

  reviewTextBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: TextField(
        controller: _reviewController,
        decoration: InputDecoration(
          hintText: '리뷰 채택 시 1000포인트를 지급, 다이닝가이드\n푸디의 유료 버전을 이용할 수 있습니다.',
          hintStyle: textStyle(color: Color(0xff898989), weight: 500, size: 16.0),
          border: InputBorder.none,
        ),
        onSubmitted: (context) {submitReview();},
        style: textStyle(weight: 500, size: 16.0),
        maxLines: 10,
      )
    );
  }

  submitReview() async {
    if(selectedIndex != -1) {
      var response = await postReview(shopId: widget.shopId, userId: userInfo.id, rating: 5-selectedIndex, content: _reviewController.text);
      if(response == true) {
        print('success');
        Navigator.pop(context);
      }
      else {
        print('fail');
        showToast('network error');
      }
    }
  }
}