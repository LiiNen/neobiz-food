import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessWidgets.dart';

class SettingView extends StatefulWidget {
  @override
  State<SettingView> createState() => _SettingView();
}
class _SettingView extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainTitleBar(title: '설정'),
          ],
        )
      )
    );
  }
}