import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/drawerMenuViews/supportView.dart';
import 'package:foodie/mainNavView/userView/userView.dart';

class HomeDrawerMenu {
  String title;
  Widget? route;
  dynamic action;
  HomeDrawerMenu({required this.title, this.route, this.action});
}

var homeDrawerMenuList = [
  HomeDrawerMenu(title: '신규 식당/여행지 제보하기'),
  HomeDrawerMenu(title: '내가 쓴 글'),
  HomeDrawerMenu(title: '프리미엄 회원'),
  HomeDrawerMenu(title: '이용권 선물'),
  HomeDrawerMenu(title: '결제내역'),
  HomeDrawerMenu(title: '1:1 문의', route: SupportView()),
  HomeDrawerMenu(title: '로그아웃'),
];

class HomeDrawer extends StatefulWidget {
  @override
  State<HomeDrawer> createState() => _HomeDrawer();
}
class _HomeDrawer extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: profileContainer()
          ),
        ] + List.generate(homeDrawerMenuList.length * 2 - 1, (index) {
          if(index%2 == 0) return homeDrawerMenuItem(homeDrawerMenuList[(index/2).floor()]);
          else return lineDivider();
        })
      )
    );
  }

  profileContainer() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        FlutterLogo(size: 66),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('username', style: textStyle(weight: 500, size: 16.0)),
            Text('user point', style: textStyle(weight: 500, size: 16.0))
          ]
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => {navigatorPush(context: context, widget: UserView())},
            behavior: HitTestBehavior.translucent,
            child: Text('마이페이지 >', style: textStyle(weight: 500, size: 16.0), textAlign: TextAlign.right,)
          )
        )
      ]
    );
  }

  homeDrawerMenuItem(HomeDrawerMenu menu) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if(menu.action != null) menu.action();
        if(menu.route != null) navigatorPush(context: context, widget: menu.route);
        print('click');
      },
      child: Container(
        margin: EdgeInsets.only(left: 18),
        height: 60,
        alignment: Alignment.centerLeft,
        child: Text(menu.title, style: textStyle(weight: 500, size: 16.0))
      )
    );
  }
}