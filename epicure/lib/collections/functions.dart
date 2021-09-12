import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodie/main.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

TextStyle textStyle({color: Colors.black, weight: int, size: 14.0}) {
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
  var preset = Map();
  preset = {
    'theme': '',
    'menu': '-1',
    'dong': '-1',
    'search': '',
    'filter': '',
    'mode': '',
    'menu_no': '',
  };
  return preset;
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

// TODO : wrong message? -> check android
void shareLink(BuildContext context, String content) async {
  String title = 'epicure share';
  Share.share(
    title,
    subject: content,
    sharePositionOrigin: Rect.fromLTWH(0, 100, maxWidth, MediaQuery.of(context).size.height - 100)
  );
}

signOutAction() async {
  final pref = await SharedPreferences.getInstance();
  pref.setString('name', '');
  pref.setString('email', '');
  pref.setString('uid', '');
  pref.setString('phone', '');
  pref.setString('tel', '');
  pref.setStringList('loginInfo', []);
}