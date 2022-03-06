import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/sharedPreferences.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/loginView/loginView.dart';
import 'package:foodie/main.dart';
import 'package:foodie/serviceViews/paymentHistoryView.dart';
import 'package:foodie/serviceViews/paymentView/paymentView.dart';
import 'package:foodie/serviceViews/reviewView/reviewView.dart';
import 'package:foodie/serviceViews/supportView.dart';

import '../mainNavView.dart';

class HomeDrawerMenu {
  dynamic icon;
  String title;
  Widget? route;
  dynamic action;
  HomeDrawerMenu({required this.icon, required this.title, this.route, this.action});
}

class HomeDrawer extends StatefulWidget {
  @override
  State<HomeDrawer> createState() => _HomeDrawer();
}
class _HomeDrawer extends State<HomeDrawer> {
  GlobalKey _profileKey = GlobalKey();

  var homeDrawerMenuList = [
    HomeDrawerMenu(icon: Image.asset('asset/image/drawerManageIcon.png', width: 17), title: '내 매장 관리하기'),
    HomeDrawerMenu(icon: Image.asset('asset/image/drawerReportIcon.png', width: 18), title: '맛집 | 여행지 제보하기', route: SupportView(supportId: 2,)),
    HomeDrawerMenu(icon: Image.asset('asset/image/drawerReviewIcon.png', width: 16), title: '내가쓴글', route: ReviewView(id: userInfo.id, isUser: true,)),
    HomeDrawerMenu(icon: Image.asset('asset/image/drawerPremiumIcon.png', width: 18), title: '프리미엄 회원', route: PaymentView()),
    HomeDrawerMenu(icon: Image.asset('asset/image/drawerPresentIcon.png', width: 18), title: '이용권 선물', route: PaymentView(isPresent: true)),
    HomeDrawerMenu(icon: Image.asset('asset/image/drawerPaymentIcon.png', width: 15), title: '결제내역', route: PaymentHistoryView()),
    HomeDrawerMenu(icon: Image.asset('asset/image/drawerInquiryIcon.png', width: 16), title: '1:1 문의', route: SupportView(supportId: 1,)),
    HomeDrawerMenu(icon: Image.asset('asset/image/drawerLogoutIcon.png', width: 15), title: '로그아웃',)
  ];

  logoutAction() async {
    await deleteUserInfo();
    navigatorPush(context: context, widget: LoginView(), replacement: true, all: true);
  }

  @override
  void initState() {
    super.initState();
    if(true) { /// 매장 유저가 아닐경우
      homeDrawerMenuList.removeAt(0);
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        /// do nothing
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfcfc),
      appBar: DefaultAppBar(title: '', elevation: false,),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: SafeArea(child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: getSizeWithKey(_profileKey) != null ? getSizeWithKey(_profileKey).height + 5 : 0),
                child: Column(
                  children: homeDrawerMenuItemList()
                )
              ),
              profileContainer(),
            ]
          )
        ))
      )
    );
  }

  profileContainer() {
    return Container(
      key: _profileKey,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Color(0x299d9d9d),
          offset: Offset(0,3),
          blurRadius: 6,
          spreadRadius: 0
        )] ,
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 48,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset('asset/image/profileDefault.png', width: 48),
                SizedBox(width: 9),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('${userInfo.name}님', style: textStyle(weight: 700, size: 16.0)),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Image.asset('asset/image/pointIcon.png', width: 16),
                          SizedBox(width: 3),
                          Text('${userInfo.point}P', style: textStyle(color: serviceColor(), weight: 500, size: 16.0))
                        ]
                      )
                    ),
                  ]
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () { navigatorPush(context: context, widget: MainNavView(initState: 3,), replacement: true, all: true); },
                    behavior: HitTestBehavior.translucent,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 88, height: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: Color(0xffe0e0e0), width: 1),
                          color: Colors.white
                        ),
                        child: Center(
                          child: Text('마이페이지', style: textStyle(weight: 700, size: 13.0))
                        )
                      )
                    )
                  )
                )
              ]
            )
          ),
          SizedBox(height: 27),
          reviewBox(context: context, reward: '1000포인트'),
          SizedBox(height: 23),
        ]
      ),
    );
  }

  homeDrawerMenuItemList() {
    return List<Widget>.generate(homeDrawerMenuList.length * 2 - 1, (index) {
      if(index%2 == 0) return homeDrawerMenuItem(homeDrawerMenuList[(index/2).floor()]);
      else return lineDivider();
    });
  }

  homeDrawerMenuItem(HomeDrawerMenu menu) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if(menu.action != null) menu.action();
        if(menu.route != null) navigatorPush(context: context, widget: menu.route);
        if(menu.title == '로그아웃') logoutAction();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 21),
        width: MediaQuery.of(context).size.width, height: 60,
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 18,
              child: Center(child: menu.icon,)
            ),
            SizedBox(width: 21),
            Text(menu.title, style: textStyle(color: menu.title=='로그아웃' ? serviceColor() : Colors.black, weight: 500, size: 15.0))
          ]
        )
      )
    );
  }
}