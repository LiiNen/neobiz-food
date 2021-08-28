import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';

import 'collections/routers.dart';
import 'collections/statelessWidgets.dart';
import 'mainGridView/mainGridView.dart';

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
            Flexible(child: MainGridView())
          ],
        )
      )
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