import 'package:flutter/material.dart';

import 'collections/routers.dart';
import 'collections/statelessWidgets.dart';

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

  void homeAction() { navRoute(context); }
}