import 'package:flutter/material.dart';
import 'package:foodie/mainGridView/townView/townView.dart';

import 'subwayView/subwayView.dart';
import 'localView/localView.dart';

class SearchNavView extends StatefulWidget {
  final int initIndex;
  SearchNavView({this.initIndex=0});
  @override
  State<SearchNavView> createState() => _SearchNavView(initIndex: initIndex);
}
class _SearchNavView extends State<SearchNavView> with SingleTickerProviderStateMixin {
  int initIndex;
  _SearchNavView({required this.initIndex});
  
  late TabController searchTabController;

  @override
  void initState() {
    super.initState();
    searchTabController = TabController(length: 3, vsync: this, initialIndex: initIndex);
  }
  @override
  void dispose() {
    searchTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchNavAppBar(),
      body: TabBarView(
        controller: searchTabController,
        children: _searchItemView
      )
    );
  }

  List<Widget> _searchItemView = <Widget>[
    LocalView(),
    SubwayView(),
    TownView()
  ];

  searchNavAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('search'),
      bottom: TabBar(
        controller: searchTabController,
        tabs: [
          Tab(text: '지역별'),
          Tab(text: '역세권'),
          Tab(text: '맛집촌'),
        ]
      ),
    );
  }
}