import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'shopViewTabInfo.dart';
import 'shopViewTabReview.dart';
import 'shopViewTabLocation.dart';

shopTabBarView({required TabController controller, required dynamic shopJson}) {
  return TabBarView(
    controller: controller,
    children: [
      ShopViewTabInfo(),
      ShopViewTabReview(),
      ShopViewTabLocation()
    ],
  );
}

class ShopViewTabBar extends StatelessWidget implements PreferredSizeWidget {
  ShopViewTabBar({required this.controller}) : preferredSize = Size.fromHeight(58.0);
  @override
  final Size preferredSize;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffededed), width: 1),
          color: Colors.white
      ),
      child: TabBar(
        controller: controller,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 7, color: Color(0xff8e8e8e)),
          insets: EdgeInsets.symmetric(horizontal: 30),
        ),
        labelColor: Color(0xff8e8e8e), unselectedLabelColor: Color(0xffe0e0e0),
        labelStyle: textStyle(weight: 500, size: 16.0),
        unselectedLabelStyle: textStyle(weight: 500, size: 16.0),
        tabs: [
          Tab(text: '정보'),
          Tab(text: '리뷰'),
          Tab(text: '위치'),
        ],
      )
    );
  }
}