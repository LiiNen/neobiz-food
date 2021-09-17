import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'searchView.dart';

class SearchNavAppBar extends StatelessWidget implements PreferredSizeWidget{
  SearchNavAppBar({required this.controller}) : preferredSize = Size.fromHeight(80.0);
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
      // TODO: text align not in vertical center with actions button
      title: Center(child: Text('지역으로 검색하기', style: textStyle(color: Colors.black, weight: 700, size: 18.0))),
      bottom: TabBar(
        controller: controller,
        indicatorColor: Colors.black,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.0),
          insets: EdgeInsets.symmetric(horizontal: 18.0)
        ),
        labelColor: Colors.black,
        tabs: [
          Tab(text: '지역별'),
          Tab(text: '역세권'),
          Tab(text: '맛집촌'),
        ]
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.black,),
          onPressed: () {
            navigatorPush(context: context, route: SearchView());
          })
      ],
    );
  }
}