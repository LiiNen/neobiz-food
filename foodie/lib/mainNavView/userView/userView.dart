import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/main.dart';

import 'modifyInfoView.dart';

class TextUserInfo {
  String category;
  String value;
  TextEditingController controller;
  TextUserInfo(this.category, this.value, this.controller);
}

// set when login success
var userInfoList = [];

class UserView extends StatefulWidget {
  @override
  State<UserView> createState() => _UserView();
}
class _UserView extends State<UserView> {

  @override
  void initState() {
    super.initState();
    _setTextUserInfoList();
  }

  void _setTextUserInfoList() {
    userInfoList = [];
    userInfoList.add(TextUserInfo('이름', userInfo.name, TextEditingController()));
    userInfoList.add(TextUserInfo('이메일', userInfo.email, TextEditingController()));
    userInfoList.add(TextUserInfo('비밀번호', '--', TextEditingController()));
    userInfoList.add(TextUserInfo('휴대전화', userInfo.phone, TextEditingController()));
    userInfoList.add(TextUserInfo('주소', userInfo.address, TextEditingController()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfcfc),
      appBar: DefaultAppBar(title: 'MY', back: false),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleColumn(),
                spaceDivider(),
                infoColumn(),
              ]
            )
          )
        )
      )
    );
  }

  titleColumn() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          subTitleContainer(title: '회원정보'),
          SizedBox(height: 18),
          modifyInfoBox(callback: () {
            navigatorPush(context: context, widget: ModifyInfoView());
          }),
          SizedBox(height: 29),
        ]
      )
    );
  }

  infoColumn() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Column(
            children: userTextFieldBuilder()
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.centerRight,
            child: withdrawalButton(),
          )
        ]
      )
    );
  }

  List<Widget> userTextFieldBuilder() {
    return userInfoList.map((e) {
      return userTextField(title: e.category, currentText: e.value, enabled: false);
    }).toList();
  }

  withdrawalButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // todo: withdrawal api
      },
      child: Container(
        width: 88, height: 33,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: const Color(0xffededed), width: 1),
          boxShadow: [BoxShadow(
            color: const Color(0x4ebababa),
            offset: Offset(0,3),
            blurRadius: 6,
            spreadRadius: 0
          )] ,
          color: Colors.white
        ),
        child: Center(
          child: Text('회원탈퇴', style: textStyle(weight: 500, size: 13.0))
        )
      )
    );
  }

  modifyInfoBox({required callback}) {
    return yellowPointBox(
      context: context,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('회원정보를 수정하고 싶으신가요?', style: textStyle(color: Color(0xffff9933), weight: 500, size: 13.0)),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              callback();
            },
            child: Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // todo: icon
                  Text('수정하기', style: textStyle(color: Color(0xffff9933), weight: 500, size: 12.0))
                ]
              )
            )
          )
        ]
      )
    );
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
              Container(
                width: 96,
                child: Text(title, style: textStyle(weight: 500, size: 15.0)),
              ),
              Expanded(child: TextField(
                enabled: enabled,
                controller: userController ?? TextEditingController(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: currentText,
                  hintStyle: enabled ?
                    textStyle(color: Colors.grey, weight: 500, size: 16.0) :
                    textStyle(color: Color(0xff8e8e8e), weight: 400, size: 15.0)
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
