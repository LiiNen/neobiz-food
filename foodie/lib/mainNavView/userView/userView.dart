import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';

class UserInfo {
  String category;
  String value;
  UserInfo(this.category, this.value);
}

// set when login success
var userInfoList = [
  UserInfo('이름', '푸디'),
  UserInfo('이메일', 'test@gmail.com'),
  UserInfo('비밀번호', 'testPW'),
  UserInfo('휴대전화', '010-0000-0000'),
  UserInfo('주소', '서울특별시 강남구'),
];

class UserView extends StatefulWidget {
  @override
  State<UserView> createState() => _UserView();
}
class _UserView extends State<UserView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: 'MY'),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            subTitleContainer(title: '회원정보'),
            SizedBox(height: 60),
          ] + userTextFieldBuilder()
        )
      )
    );
  }

  List<Widget> userTextFieldBuilder() {
    return userInfoList.map((e) {
      return userTextField(title: e.category, currentText: e.value, enabled: false);
    }).toList();
  }
}

Widget userTextField({required String title, required String currentText, TextEditingController? userController, bool enabled=true}) {
  return Container(
    margin: EdgeInsets.only(bottom: 28),
    child: Column(
      children: [
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: textStyle(weight: 500, size: 16.0)),
              SizedBox(width: 10),
              Expanded(child: TextField(
                enabled: enabled,
                controller: userController ?? TextEditingController(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: currentText,
                  hintStyle: enabled ?
                    textStyle(color: Colors.grey, weight: 500, size: 16.0) :
                    textStyle(color: Colors.black, weight: 500, size: 16.0)
                )
              ))
            ],
          )
        ),
        lineDivider(),
      ]
    )
  );
}