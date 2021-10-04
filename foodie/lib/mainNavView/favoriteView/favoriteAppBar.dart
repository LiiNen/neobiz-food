import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';

class FavoriteAppBar extends StatelessWidget implements PreferredSizeWidget{
  FavoriteAppBar({required this.controller}) : preferredSize = Size.fromHeight(80.0);
  @override
  final Size preferredSize;
  final TabController controller;

  get indicatorColor => null;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text('찜', style: textStyle(color: Colors.black, weight: 700, size: 18.0)),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            controller: controller,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 6.0, color: Color(0xff8e8e8e)),
              insets: EdgeInsets.only(
                left: 16, right: 0, bottom: 0
              ),
            ),
            labelColor: Color(0xff8e8e8e),
            isScrollable: true,
            labelPadding: EdgeInsets.only(left: 0, right: 0),
            tabs: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 0),
                child: Tab(text: '레드리스트'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 0),
                child: Tab(text: '그린리스트'),
              ),
            ]
          ),
        )
      )
    );
  }
}