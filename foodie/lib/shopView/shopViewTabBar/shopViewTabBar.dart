import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'shopViewTabInfo.dart';
import 'shopViewTabReview.dart';
import 'shopViewTabLocation.dart';

shopTabBarView({required TabController controller, required dynamic shopJson}) {
  return Container(
    child: [
      ShopViewTabInfo(shopJson),
      ShopViewTabReview(shopJson),
      ShopViewTabLocation(shopJson)
    ][controller.index],
  );
}

class ShopViewTabBar extends StatelessWidget implements PreferredSizeWidget {
  ShopViewTabBar({required this.controller}) : preferredSize = Size.fromHeight(55.0);
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
          borderSide: BorderSide(width: 4, color: serviceColor()),
          insets: EdgeInsets.symmetric(horizontal: 30),
        ),
        labelColor: serviceColor(), unselectedLabelColor: Color(0xff8e8e8e),
        labelStyle: textStyle(color: serviceColor(), weight: 700, size: 16.0),
        unselectedLabelStyle: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0),
        tabs: [
          Tab(text: '정보'),
          Tab(text: '리뷰'),
          Tab(text: '위치'),
        ],
      )
    );
  }
}