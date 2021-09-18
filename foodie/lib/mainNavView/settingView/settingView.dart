import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessAppBar.dart';

class SettingView extends StatefulWidget {
  @override
  State<SettingView> createState() => _SettingView();
}
class _SettingView extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '검색'),
      body: Text('sett')
    );
  }
}