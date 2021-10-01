import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/mainNavView/searchView/searchCategoryView/searchLocalView.dart';
import 'package:foodie/mainNavView/searchView/searchCategoryView/searchPositionView.dart';
import 'package:foodie/mainNavView/searchView/searchCategoryView/searchSubwayView.dart';
import 'package:foodie/mainNavView/searchView/searchCategoryView/searchTownView.dart';

import 'homeBannerContainer.dart';
import 'homeDrawer.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeView();
}
class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeViewAppBar(),
      endDrawer: HomeDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            HomeBannerContainer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  subTitleContainer(title: '카테고리'),
                ] + categorySelectionContainer()
              )
            )
          ]
        )
      )
    );
  }

  List<Widget> categorySelectionContainer() {
    var categoryItemContainerList = List.generate(categoryItemList.length, (index) {
      return categoryItemContainer(categoryItemList[index]);
    });
    return [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          children: [
            Row(
              children: [
                categoryItemContainerList[0],
                SizedBox(width: 58),
                categoryItemContainerList[1],
              ]
            ),
            Row(
              children: [
                categoryItemContainerList[2],
                SizedBox(width: 58),
                categoryItemContainerList[3],
              ]
            )
          ]
        )
      )
    ];
  }

  categoryItemContainer(CategoryItem categoryItem) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 16),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            if(categoryItem.route != null) navigatorPush(context: context, widget: categoryItem.route);
          },
          child: Container(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: FlutterLogo()
                ),
                SizedBox(height: 8),
                Text(categoryItem.title),
              ],
            )
          )
        )
      )
    );
  }
}

class CategoryItem {
  String title;
  String? imgSrc;
  Widget? route;
  CategoryItem({required this.title, this.imgSrc, this.route});
}

List<CategoryItem> categoryItemList = [
  CategoryItem(title: '지역별', route: SearchLocalView()),
  CategoryItem(title: '역세권', route: SearchSubwayView()),
  CategoryItem(title: '맛집촌', route: SearchTownView()),
  CategoryItem(title: '위치기반', route: SearchPositionView()),
];