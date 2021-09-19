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
  bool? isEmailSubscribe;
  bool? isSnsSubscribe;

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
            SizedBox(height: 5),
            subscribeContainer('이메일'),
            subscribeContainer('SNS'),
          ],
        )
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(0.0),
        child: loginNextButton(title: '완료', context: context, route: LoginView(), dialog: showCompleteDialog, isReplace: true),
      ),
    );
  }

  subscribeContainer(String title) {
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

            ],
          )
        ],
      )
    );
  }
}