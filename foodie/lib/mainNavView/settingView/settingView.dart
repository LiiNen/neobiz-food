import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingView extends StatefulWidget {
  @override
  State<SettingView> createState() => _SettingView();
}
class _SettingView extends State<SettingView> {

  /// TODO: email과 sns의 경우 로그인 시에 정보를 가져다놓고 계속 활용한다
  /// push의 경우에는 sharedpref 사용, 혹시 웹에서도 사용할 정보라면 마찬가지로 디비에서 접근
  /// bool isEmailSubscribe;
  /// bool isSnsSubscribe;
  /// bool isPushSubscribe;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(title: '설정'),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            settingBuilder(title: '이메일 수신설정'),
            settingBuilder(title: 'SNS 수신설정'),
            settingBuilder(title: '푸시알림서비스')
          ]
        )
      )
    );
  }

  settingBuilder({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 22),
        Text(title),
        SizedBox(height: 12),
        Row(
          children: [
            settingItem(index: 0),
            SizedBox(width: 16),
            settingItem(index: 1)
          ],
        ),
        SizedBox(height: 4),
      ]
    );
  }
  settingItem({required int index}) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Color(0xffededed)
          ),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              print(index);
            },
            child: Center(
              child: Text(index==0 ? '수신함' : '수신안함')
            )
          )
        )
      )
    );
  }
}