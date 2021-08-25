import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message){
  Fluttertoast.showToast(msg: message,
    gravity: ToastGravity.BOTTOM
  );
}

TextStyle textStyle({color: Colors.black, weight: int, size: double}) {
  FontWeight fontWeight = FontWeight.normal;
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
    fontFamily: "AppleSDGothicNeo",
    fontStyle:  FontStyle.normal,
    fontSize: size
  );
}

textFieldClear(TextEditingController controller) {
  controller.clear();
}

navigatorPush({required BuildContext context, required Widget route, bool isReplace=false}) {
  isReplace
    ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route))
    : Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}