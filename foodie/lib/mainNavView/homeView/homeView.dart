import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/searchCategoryView/searchCategoryView.dart';
import 'package:foodie/shopContainerView/recShopContainer.dart';

import 'homeBannerContainer.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeView();
}
class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfcfc),
      appBar: HomeViewAppBar(),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              searchBoxContainer(),
              SizedBox(height: 28),
              categoryBoxContainer(),
              SizedBox(height: 60),
              HomeBannerContainer(),
              SizedBox(height: 40),
              reviewBox(context: context, reward: '푸디 포인트를'),
              SizedBox(height: 34),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Text('내 주변 맛집은?', style: textStyle(weight: 700, size: 19.0), textAlign: TextAlign.start,),
              ),
              SizedBox(height: 20),
              RecShopContainerList([1, 1, 1, 1, 1,]),
              SizedBox(height: 21),
              copyrightBox(),
            ]
          )
        )
      )
    );
  }

  searchBoxContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: const Color(0xffff7c2f), width: 1),
        boxShadow: [BoxShadow(
          color: const Color(0x0d000000),
          offset: Offset(0,3),
          blurRadius: 6,
          spreadRadius: 0
        )] ,
        color: Colors.white
      )
      //todo: textfield child
    );
  }

  categoryBoxContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            width: MediaQuery.of(context).size.width,
            child: Text('카테고리', style: textStyle(color: Colors.black, weight: 700, size: 19.0))
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              children: [
                categoryBox(0),
                Expanded(child: Container(),),
                categoryBox(1),
                Expanded(child: Container(),),
                categoryBox(2)
              ]
            )
          ),
        ]
      )
    );
  }
  var categoryList = ['Region', 'Subway', 'Region'];
  var categoryNameList = ['지역별', '역주변', '맛집촌'];
  categoryBox(int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        navigatorPush(context: context, widget: SearchCategoryView(initialIndex: index,));
      },
      child: Container(
        width: 93, height: 93,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Color(0xffededed), width: 1),
          boxShadow: [BoxShadow(
            color: Color(0x45989898),
            offset: Offset(0,2),
            blurRadius: 4,
            spreadRadius: 0
          )] ,
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(categoryItemList[index].imgSrc),
            SizedBox(height: 6.7),
            Text(categoryItemList[index].title, style: textStyle(weight: 500, size: 14.0)),
            SizedBox(height: 8),
          ]
        )
      )
    );
  }

  copyrightBox() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 28),
          Image.asset('asset/image/logo.png', width: 100),
          SizedBox(height: 8.6),
          Text('Copyright 네오비즈 All Right Reserved', style: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 11.0)),
          SizedBox(height: 28),
          Text('사업자 등록번호:210-09-30249 | 통신판매업신고:제 959호\n설립일: 2002년 12월 24일', style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 11.0)),
          SizedBox(height: 19),
          Text('대표: 최유식 | 개인정보 책임자: 박기향\n주소: 경기도 고양시 일산서구 가좌1로 10 512-1301\n이메일: voom365@naver.com', style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 11.0)),
          SizedBox(height: 63),
        ]
      )
    );
  }
}

class CategoryItem {
  String title;
  String imgSrc;
  CategoryItem({required this.title, required this.imgSrc});
}

List<CategoryItem> categoryItemList = [
  CategoryItem(title: '지역별', imgSrc: 'asset/image/categoryRegion.png'),
  CategoryItem(title: '역주변', imgSrc: 'asset/image/categorySubway.png'),
  CategoryItem(title: '맛집촌', imgSrc: 'asset/image/categoryTown.png'),
];