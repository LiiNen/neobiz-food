import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodie/collections/functions.dart';

import '../main.dart';

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

spaceDivider({color: const Color(0xffededed)}) {
  return Container(
    height: 8,
    decoration: BoxDecoration(
      color: color
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
  return Color(0xffff7c2f);
}

bottomNavigationButton({required title, required action}) {
  return Padding(
    padding: EdgeInsets.all(0.0),
    child: fullWidthButton(title: title, action: action),
  );
}

fullWidthButton({required title, required action, double height=58}){
  return GestureDetector(
    onTap: () {action();},
    child: Container(
      height: height,
      width: maxWidth,
      decoration: BoxDecoration(
        border: Border.all(
          color: serviceColor()
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        color: serviceColor(),
      ),
      child: Center(child: Text(title, style: textStyle(color: Colors.white, weight: 700, size: 16.0)))
    )
  );
}

fullWidthTextField(String hintText, TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(bottom: 28),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          child: TextField(
            controller: controller,
            obscureText: (hintText == '비밀번호' || hintText == '비밀번호 확인' ? true : false),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 15.0),
            )
          )
        ),
        // SizedBox(height: 8),
        lineDivider()
      ]
    )
  );
}