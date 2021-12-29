import 'package:flutter/material.dart';
import 'package:foodie/mainNavView/searchPositionView/searchPositionViewTabBar.dart';

class SearchPositionTabView extends StatefulWidget {
  final dynamic colorChangeListener;
  final bool isRed;
  SearchPositionTabView({required this.colorChangeListener, required this.isRed});
  @override
  State<SearchPositionTabView> createState() => _SearchPositionTabView();
}
class _SearchPositionTabView extends State<SearchPositionTabView> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this, initialIndex: 0);
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
    return Column(
      children: [
        SearchPositionTabBar(controller: controller),
        Expanded(
          child: searchPositionTabBarView(controller: controller, colorChangeListener: widget.colorChangeListener, isRed: widget.isRed)
        )
      ]
    );
  }
}