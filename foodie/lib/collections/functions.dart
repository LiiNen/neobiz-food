import 'package:flutter/material.dart';

TextStyle textStyle({color: Colors.black, weight: int, size: double}) {
  FontWeight fontWeight = FontWeight.w400;
  switch(weight) {
    case 400:
      fontWeight = FontWeight.w400;
      break;
    case 600:
      fontWeight = FontWeight.w600;
      break;
    case 700:
      fontWeight = FontWeight.w700;
      break;
  }
  return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontFamily: "NotoSansKR",
      fontStyle:  FontStyle.normal,
      fontSize: size
  );
}

navigatorPush({required context, required widget, replacement=false}) {
  replacement
    ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget))
    : Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}