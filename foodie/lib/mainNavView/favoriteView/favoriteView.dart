import 'package:flutter/material.dart';

import 'favoriteAppBar.dart';
import 'favoriteList.dart';

class FavoriteView extends StatefulWidget {
  @override
  State<FavoriteView> createState() => _FavoriteView();
}
class _FavoriteView extends State<FavoriteView> with SingleTickerProviderStateMixin{
  late TabController favoriteTabController;

  @override
  void initState() {
    super.initState();
    favoriteTabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FavoriteAppBar(controller: favoriteTabController),
      body: TabBarView(
        controller: favoriteTabController,
        children: _favoriteTabView
      )
    );
  }

  List<Widget> _favoriteTabView = <Widget>[
    FavoriteRedList(),
    FavoriteGreenList()
  ];
}