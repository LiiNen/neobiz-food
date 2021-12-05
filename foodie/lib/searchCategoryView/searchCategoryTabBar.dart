import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'searchLocalView.dart';
import 'searchSubwayView.dart';
import 'searchTownView.dart';

searchCategoryTabBarView({required TabController controller}) {
  return Container(
    child: [
      SearchLocalView(),
      SearchSubwayView(),
      SearchTownView(),
    ][controller.index],
  );
}

class SearchCategoryTabBar extends StatelessWidget implements PreferredSizeWidget {
  SearchCategoryTabBar({required this.controller}) : preferredSize = Size.fromHeight(40.0);
  @override
  final Size preferredSize;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: const Color(0x15000000),
          offset: Offset(0,2),
          blurRadius: 4,
          spreadRadius: 0
        )] ,
        color: const Color(0xffffffff)
      ),
      child: TabBar(
        controller: controller,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 4.0, color: serviceColor()),
        ),
        labelColor: serviceColor(),
        labelStyle: textStyle(color: serviceColor(), weight: 700, size: 15.0),
        unselectedLabelColor: Color(0xffd1d5d9),
        unselectedLabelStyle: textStyle(color: Color(0xff898989), weight: 500, size: 15.0),
        tabs: [
          Tab(text: '지역별'),
          Tab(text: '역주변'),
          Tab(text: '맛집촌'),
        ]
      )
    );
  }
}