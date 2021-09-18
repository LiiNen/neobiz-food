import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodie/collections/routers.dart';
import 'package:foodie/main.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

signOutAction(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();
  pref.setString('name', '');
  pref.setString('email', '');
  pref.setString('uid', '');
  pref.setString('phone', '');
  pref.setString('tel', '');
  pref.setStringList('loginInfo', []);
  mainRoute(context);
}

marginLR({double vertical=0.0}) {
  return EdgeInsets.symmetric(horizontal: 18, vertical: vertical);
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

Widget buildSquare({required bool isSelected, required String title}) {
  return AspectRatio(
    aspectRatio: 1.0,
    child: Container(
      // TODO: shadow code with designer
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff4F4F4F) : Colors.white,
        borderRadius: BorderRadius.circular(2)
      ),
      child: Center(child: Text(title, style: textStyle(color: isSelected ? Colors.white : Color(0xff4F4F4F), weight: 600, size: 14.0 ),))
    )
  );
}

String threeDigit(var input) {
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  return input.toString().replaceAllMapped(reg, mathFunc);
}