import 'package:flutter/material.dart';
import 'package:foodie/collections/asyncFunctions.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/main.dart';

class SettingItem {
  String title;
  Icon icon;
  bool isVoucher;
  bool isToggle;
  Widget? route;
  dynamic action;
  SettingItem({required this.title, required this.icon, this.isVoucher=false, this.isToggle=false, this.route, this.action});
}

List<SettingItem> settingItemList = [
  SettingItem(title: '푸시알림 서비스', icon: Icon(Icons.notifications_none), isToggle: true),
  SettingItem(title: '이용권 구매', icon: Icon(Icons.payment), isVoucher: true),
  SettingItem(title: '이용권 등록', icon: Icon(Icons.card_membership), isVoucher: true),
  SettingItem(title: '이용권 선물하기', icon: Icon(Icons.card_giftcard), isVoucher: true),
  SettingItem(title: '내 정보 변경', icon: Icon(Icons.person_rounded)),
  SettingItem(title: '결제정보 관리', icon: Icon(Icons.payments)),
  SettingItem(title: '찜한 맛집 리스트', icon: Icon(Icons.star)),
  SettingItem(title: '평가한 맛집', icon: Icon(Icons.rice_bowl_rounded)),
  SettingItem(title: '회원탈퇴', icon: Icon(Icons.exit_to_app)),
  SettingItem(title: '로그아웃', icon: Icon(Icons.exit_to_app), action: signOutAction),
];

class SettingView extends StatefulWidget {
  @override
  State<SettingView> createState() => _SettingView();
}
class _SettingView extends State<SettingView> {
  @override
  void initState() {
    super.initState();
    checkSubscribe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MainTitleBar(title: '설정'),
          ] + settingItemBuilder(),
        )
      )
    );
  }

  List<Widget> settingItemBuilder() {
    return settingItemList.map((e) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  if(e.isToggle) {

                  }
                  else if(e.action != null) {
                    e.action(context);
                  }
                  else {
                    navigatorPush(context: context, route: e.route!);
                  }
                },
              )
            ),
            Center(child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    e.icon,
                    Text(e.title),
                  ]
                ),
                e.isToggle ? GestureDetector(
                  onTap: () {setState(() {toggleSubscribe();});},
                  child: isSubscribe ? Icon(Icons.toggle_on_rounded) : Icon(Icons.toggle_off_outlined)
                ) : Icon(Icons.chevron_right)
              ]
            ))
          ]
        )
      );
    }).toList();
  }

  toggleSubscribe() {
    isSubscribe = !isSubscribe;
    setSubscribe();
  }
}