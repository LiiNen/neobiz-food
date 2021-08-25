import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';

import 'collections/statelessWidgets.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeView();
}
class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'home view'),
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
      appBar: MainAppBar(title: 'welcome view'),
      body: confirmButton(title: 'next', confirmAction: homeRoute)
    );
  }

  void homeRoute() { navigatorPush(context: context, route: HomeView()); }
}