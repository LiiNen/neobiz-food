import 'package:flutter/material.dart';
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
            SizedBox(height: 4),
            subscribeContainer('이메일', isEmailSubscribe),
            subscribeContainer('SNS', isSnsSubscribe),
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
          Text('$title 수신설정', style: textStyle(weight: 500, size: 16.0)),
          SizedBox(height: 16),
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
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: isSelected ? Color(0xff2d3572) : Color(0xffededed),
          ),
          child: Center(
            child: isPositive ? Text('수신함', style: textStyle(color: isSelected ? Colors.white : Color(0xff8e8e8e), weight: 500, size: 16.0)) : Text('수신안함', style: textStyle(color: isSelected ? Colors.white : Color(0xff8e8e8e), weight: 500, size: 16.0))
          )
        )
      )
    );
  }
}