import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodie/collections/functions.dart';

subTitleContainer({required String title, double topMargin=16}) {
  return Container(
    margin: EdgeInsets.only(top: topMargin),
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

serviceColor() {
  return Color(0xffff851c);
}