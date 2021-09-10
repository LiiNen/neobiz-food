import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';

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
      appBar: homeViewAppBar(),
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
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          categoryItemContainerList[0],
          categoryItemContainerList[1],
        ]
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          categoryItemContainerList[2],
          categoryItemContainerList[3],
        ]
      )
    ];
  }

  categoryItemContainer(CategoryItem categoryItem) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if(categoryItem.route != null) navigatorPush(context: context, widget: categoryItem.route);
        },
        child: Container(
          child: Column(
            children: [
              FlutterLogo(size: 112),
              SizedBox(height: 8),
              Text(categoryItem.title),
            ],
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
  CategoryItem(title: '지역별'),
  CategoryItem(title: '역세권'),
  CategoryItem(title: '맛집촌'),
  CategoryItem(title: '위치기반'),
];

homeViewAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text('foodie'),
  );
}