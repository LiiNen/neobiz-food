import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodie/collections/functions.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  DefaultAppBar({required this.title}) : preferredSize = Size.fromHeight(56.0);
  @override
  final Size preferredSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      brightness: Brightness.light,
      backgroundColor: const Color(0xffffffff),
      centerTitle: true,
      title: Text(title, style: textStyle(weight: 500, size: 16.0),)
    );
  }
}

subTitleContainer({required String title}) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: Text(title, style: textStyle(weight: 500, size: 19.0))
  );
}

lineDivider({color: const Color(0xffe8e8e8)}) {
  return Container(
    height: 1,
    decoration: BoxDecoration(
      border: Border.all(
        color: color,
        width: 1
      )
    )
  );
}

swiperPagination() {
  return SwiperPagination(
    alignment: Alignment.bottomCenter,
    margin: EdgeInsets.all(4),
    builder: DotSwiperPaginationBuilder(
        color: Color(0xffd9dee7), size: 6.0,
        activeColor: Color(0xff0058cc), activeSize: 6.0
    )
  );
}