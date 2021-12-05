import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'searchCategoryTabBar.dart';

class SearchCategoryView extends StatefulWidget {
  final int initialIndex;
  SearchCategoryView({this.initialIndex = 0});

  @override
  State<SearchCategoryView> createState() => _SearchCategoryView(initialIndex);
}
class _SearchCategoryView extends State<SearchCategoryView> with SingleTickerProviderStateMixin {
  int initialIndex;
  _SearchCategoryView(this.initialIndex);

  late TabController _categoryTabController;

  @override
  void initState() {
    super.initState();
    _categoryTabController = TabController(length: 3, vsync: this, initialIndex: initialIndex);
    _categoryTabController.addListener(_tabChangeListener);
  }

  @override
  void dispose() {
    _categoryTabController.dispose();
    super.dispose();
  }

  _tabChangeListener() {
    if(_categoryTabController.indexIsChanging) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      body: Container(
        child: Column(
          children: [
            SearchCategoryTabBar(controller: _categoryTabController),
            Expanded(child: SingleChildScrollView(
              child: searchCategoryTabBarView(controller: _categoryTabController),
            ))
          ]
        )
      )
    );
  }
}