import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodie/collections/functions.dart';

import '../main.dart';

subTitleContainer({required String title, double topMargin=0}) {
  return Container(
    margin: EdgeInsets.only(top: topMargin),
    child: Text(title, style: textStyle(weight: 500, size: 21.0))
  );
}

lineDivider({color: const Color(0xffededed), vertical: false}) {
  if(vertical) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 0.35
        )
      )
    );
  }
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
  return Opacity(
    opacity : 0.34867000579833984,
    child: Container(
      height: 8,
      decoration: BoxDecoration(
        color: color
      )
    )
  );
}

swiperPagination() {
  return SwiperPagination(
    alignment: Alignment.bottomCenter,
    margin: EdgeInsets.only(top: 25, bottom: 12),
    builder: DotSwiperPaginationBuilder(
      color: Color(0xffededed), size: 7.0,
      activeColor: serviceColor(), activeSize: 7.0
    )
  );
}

serviceColor() {
  return Color(0xffff7c2f);
}

bottomNavigationButton({required title, required action}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20),
    child: fullWidthButton(title: title, action: action),
  );
}

fullWidthButton({required title, required action, double height=70}){
  return GestureDetector(
    onTap: () {action();},
    child: Container(
      height: height,
      width: maxWidth,
      decoration: BoxDecoration(
        border: Border.all(
          color: serviceColor()
        ),
        // borderRadius: BorderRadius.all(
        //   Radius.circular(4),
        // ),
        color: serviceColor(),
      ),
      child: Center(child: Text(title, style: textStyle(color: Colors.white, weight: 700, size: 15.0)))
    )
  );
}

fullWidthTextField(String hintText, TextEditingController controller, {double margin=28, bool isNumber=false, Widget? rightButton, bool enabled=true}) {
  return Container(
    margin: EdgeInsets.only(bottom: margin),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 24,
                child: TextField(
                  controller: controller,
                  obscureText: (hintText == '비밀번호' || hintText == '비밀번호 확인' ? true : false),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.all(0),
                    hintText: hintText,
                    hintStyle: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0),
                  ),
                  style: textStyle(color: Colors.black, weight: 500, size: 16.0),
                  keyboardType: isNumber ? TextInputType.number : TextInputType.text,
                  enabled: enabled,
                ),
              ),
            ),
            rightButton==null ? Container() : rightButton,
          ]
        ),
        // SizedBox(height: 8),
        lineDivider()
      ]
    )
  );
}

reviewBox({required BuildContext context, required String reward}) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      // todo: push to review
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      width: MediaQuery.of(context).size.width,
      height: 47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Color(0xffffe489)
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/image/review/reviewIcon.png', width: 12),
            SizedBox(width: 5),
            Text('리뷰를 작성하고 ${reward} 받아보세요!', style: textStyle(color: Color(0xffff9933), weight: 700, size: 13.0)),
          ]
        )
      )
    )
  );
}

yellowPointBox({required BuildContext context, required Widget child}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 47,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      color: Color(0xffffe489)
    ),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: child
    )
  );
}

bottomTapButton(BuildContext context, dynamic callback) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      callback();
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 21, bottom: 10),
      child: Center(
        child: Container(
          width: 33, height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Color(0xffe0e0e0)
          )
        )
      )
    )
  );
}

fullWidthShadowButton(String title, dynamic onTap) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 18),
    child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap();
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Color(0xffededed), width: 1),
          boxShadow: [BoxShadow(
            color: Color(0x219b9b9b),
            offset: Offset(0,3),
            blurRadius: 6,
            spreadRadius: 0
          )] ,
          color: Colors.white
        ),
        child: Center(
          child: Text(title, style: textStyle(weight: 500, size: 14.0)),
        )
      )
    )
  );
}