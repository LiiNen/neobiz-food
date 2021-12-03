import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/loginView/signUpView.dart';

import 'completeDialog.dart';
import 'loginView.dart';

class SubscribeInitView extends StatefulWidget {
  @override
  State<SubscribeInitView> createState() => _SubscribeInitView();
}
class _SubscribeInitView extends State<SubscribeInitView> {
  bool isEmailSubscribe = true;
  bool isSnsSubscribe = true;
  bool isPushSubscribe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(title: '회원가입'),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            loginStep(step: 2, title: '정보 수신 설정'),
            SizedBox(height: 19),
            subscribeContainer('이메일', isEmailSubscribe),
            subscribeContainer('SNS', isSnsSubscribe),
            subscribeContainer('푸시알림서비스', isPushSubscribe),
          ],
        )
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(0.0),
        child: loginNextButton(title: '완료', context: context, route: LoginView(), dialog: showCompleteDialog, isReplace: true),
      ),
    );
  }

  subscribeContainer(String title, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(top: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.length < 5 ? '$title 수신설정' : title, style: textStyle(weight: 500, size: 16.0)),
          SizedBox(height: 11),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              subscribeBox(title, true, isSelected),
              SizedBox(width: 16),
              subscribeBox(title, false, !isSelected),
            ],
          )
        ],
      )
    );
  }
  subscribeBox(String title, bool isPositive, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {
            if(!isSelected) {
              if(title == '이메일') isEmailSubscribe = !isEmailSubscribe;
              else if(title == 'SNS') isSnsSubscribe = !isSnsSubscribe;
            }
          });
        },
        child: Container(
          height: 47,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: isSelected ? serviceColor() : Color(0xffe0e0e0)),
            color: isSelected ? serviceColor() : Colors.white
          ),
          child: Center(
            child: isPositive ?
              Text('수신함', style: textStyle(color: isSelected ? Colors.white : Color(0xff8e8e8e), weight: 500, size: 16.0)) :
              Text('수신안함', style: textStyle(color: isSelected ? Colors.white : Color(0xff8e8e8e), weight: 500, size: 16.0))
          )
        )
      )
    );
  }
}