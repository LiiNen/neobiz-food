import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/routers.dart';
import 'package:foodie/collections/statelessWidgets.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeView();
}
class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => onWillPop(context),
        child: Scaffold(
            appBar: MainAppBar(),
            body: Column(
              children: [
                MainTitleBar(title: 'home view'),
                signOutButton(),
              ],
            )
        )
    );
  }
  signOutButton() {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          signOutAction().then((_) {loginRoute(context);});
        },
        child: Text('로그아웃')
    );
  }
}

class WelcomeView extends StatefulWidget {
  @override
  State<WelcomeView> createState() => _WelcomeView();
}
class _WelcomeView extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
        body: Column(
            children: [
              MainTitleBar(title: 'welcome view'),
              confirmButton(title: 'next', confirmAction: homeAction)
            ]
        )
    );
  }

  void homeAction() { homeRoute(context); }
}