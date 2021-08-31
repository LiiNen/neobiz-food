import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> onWillPop(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('에피큐어 종료'),
      content: Text('에피큐어를 종료하시겠습니까?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: Text('Yes'),
        ),
      ],
    ),
  )) ?? false;
}

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

phoneFieldAuto(String value, TextEditingController controller) {
  var length = value.length;
  if(length == 4 || length == 9) {
    if(value[length - 1] == '-') controller.text = value.substring(0, length - 1);
    else controller.text = value.substring(0, length - 1) + '-' + value[length-1];
    controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
  }
}

presetRequestBody() {
  var preset = Map<String, dynamic>();
  preset['theme'] = '';
  preset['menu'] = -1;
  preset['dong'] = -1;
  preset['search'] = '';
  return preset;
}