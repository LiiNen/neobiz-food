import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'searchPositionGoogleView.dart';
import 'searchPositionListView.dart';

searchPositionTabBarView({required TabController controller, required dynamic colorChangeListener, required bool isRed}) {
  return Container(
    child: [
      Platform.isAndroid ? SearchPositionKakaoView() : SearchPositionGoogleView(colorChangeListener: colorChangeListener, isRed: isRed),
      SearchPositionListView(colorChangeListener: colorChangeListener, isRed: isRed)
    ][controller.index]
  );
}

class SearchPositionTabBar extends StatelessWidget implements PreferredSizeWidget {
  SearchPositionTabBar({required this.controller}) : preferredSize = Size.fromHeight(40);
  @override
  final Size preferredSize;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffededed), width: 1),),
        color: Colors.white
      ),
      child: TabBar(
        controller: controller,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 4, color: serviceColor()),
        ),
        labelColor: serviceColor(), unselectedLabelColor: Color(0xff8e8e8e),
        labelStyle: textStyle(color: serviceColor(), weight: 700, size: 15.0),
        labelPadding: EdgeInsets.only(bottom: 7),
        unselectedLabelStyle: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 15.0),
        tabs: [
          Tab(text: 'MAP'),
          Tab(text: 'LIST'),
        ],
      )
    );
  }
}