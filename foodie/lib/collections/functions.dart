import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message){
  Fluttertoast.showToast(msg: message,
      gravity: ToastGravity.BOTTOM
  );
}

TextStyle textStyle({color: Colors.black, weight: int, size: double}) {
  FontWeight fontWeight = FontWeight.w400;
  switch(weight) {
    case 400:
      fontWeight = FontWeight.w400;
      break;
    case 500:
      fontWeight = FontWeight.w500;
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

navigatorPush({required context, required widget, replacement=false, all=false}) {
  replacement
    ? all
      ? Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget), (route) => false)
      : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget))
    : Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

String htmlTagRemover(String target) {
  // todo: parser with new api
  target = target.split('</p><p><br></p><p>')[0];
  target = target.replaceAll('</p>', '');
  target = target.replaceAll('<p>', '\n');
  target = target.replaceAll('<br>', '\n');
  return target;
}


