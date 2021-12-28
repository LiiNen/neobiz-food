import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'searchPositionGoogleView.dart';
import 'searchPositionListView.dart';

searchPositionTabBarView({required TabController controller}) {
  return Container(
    child: [
      Platform.isAndroid ? SearchPositionKakaoView() : SearchPositionGoogleView(),
      SearchPositionListView()
    ][controller.index]
  );
}

class SearchPositionTabBar extends StatelessWidget implements PreferredSizeWidget {
  SearchPositionTabBar({required this.controller}) : preferredSize = Size.fromHeight(60);
  @override
  final Size preferredSize;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffededed), width: 1),),
        color: Colors.white
      ),
      child: TabBar(
        controller: controller,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 4, color: serviceColor()),
          insets: EdgeInsets.symmetric(horizontal: 0),
        ),
        labelColor: serviceColor(), unselectedLabelColor: Color(0xff8e8e8e),
        labelStyle: textStyle(color: serviceColor(), weight: 700, size: 16.0),
        unselectedLabelStyle: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0),
        tabs: [
          Tab(text: 'MAP'),
          Tab(text: 'LIST'),
        ],
      )
    );
  }
}