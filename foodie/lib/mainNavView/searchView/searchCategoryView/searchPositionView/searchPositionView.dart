import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'searchPositionViewTabBar.dart';

class SearchPositionView extends StatefulWidget {
  @override
  State<SearchPositionView> createState() => _SearchPositionView();
}
class _SearchPositionView extends State<SearchPositionView> with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this, initialIndex: 0);
    controller.addListener(_controllerListener);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _controllerListener() {
    if(controller.indexIsChanging) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '위치'),
      body: Column(
        children: [
          SearchPositionTabBar(controller: controller),
          searchPositionTabBarView(controller: controller)
        ]
      )
    );
  }
}