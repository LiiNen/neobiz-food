import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 26, height: 26,
              child: Center(
                child: SvgPicture.asset('asset/svgIcon/icoBack.svg', width: 6.5, height: 13)
              )
            )
          ),
          Text('지역으로 검색하기', style: textStyle(color: Colors.black, weight: 700, size: 18.0)),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              navigatorPush(context: context, route: SearchView());
            },
            child: SvgPicture.asset('asset/svgIcon/icoSearch.svg', width: 26, height: 26)
          )
        ]
      ),
      bottom: TabBar(
        controller: controller,
        indicatorColor: Colors.black,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2.0),
          // TODO: indicator size resizing
          insets: EdgeInsets.symmetric(horizontal: 18.0)
        ),
        labelColor: Colors.black,
        tabs: [
          Tab(text: '지역별'),
          Tab(text: '역세권'),
          Tab(text: '맛집촌'),
        ]
      ),
    );
  }
}