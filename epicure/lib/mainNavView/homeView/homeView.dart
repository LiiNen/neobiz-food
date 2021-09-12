import 'package:flutter/material.dart';
import 'package:foodie/collections/asyncFunctions.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/mainGridView/localView/localView.dart';
import 'package:foodie/mainGridView/subwayView/subwayView.dart';
import 'package:foodie/mainGridView/townView/townView.dart';
import 'package:foodie/mainNavView/homeView/homeBannerContainer.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeView();
}
class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        appBar: MainAppBar(),
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: [
            homeSearchField(),
            typeSelectionRow(),
            HomeBannerContainer(),
            homeRedList(),
          ],
        )
      )
    );
  }

  homeSearchField() {
    return Container(
      margin: marginLR(),
      height: 40,
      child: TextField(

      )
    );
  }

  typeSelectionRow() {
    return Container(
      margin: marginLR(vertical: 12.0),
      height: 40,
      child: Row(
        children: [
          typeSelectionItem(title: '지역별', route: LocalView()),
          SizedBox(width: 10,),
          typeSelectionItem(title: '역세권', route: SubwayView()),
          SizedBox(width: 10,),
          typeSelectionItem(title: '맛집촌', route: TownView()),
        ],
      )
    );
  }
  typeSelectionItem({required String title, Widget? route}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {navigatorPush(context: context, route: route!);},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
          ),
          child: Center(child: Text(title, style: textStyle(weight: 600, size: 16.0))),
        )
      )
    );
  }

  homeRedList() {
    return Container(
      margin: marginLR(),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('레드리스트'),
              Text('Green list 보기')
            ],
          ),
          lineDivider(),
          FlutterLogo(size: 70),
          FlutterLogo(size: 70),
          FlutterLogo(size: 70),
          FlutterLogo(size: 70),
          FlutterLogo(size: 70),
          FlutterLogo(size: 70),
          FlutterLogo(size: 70),
          FlutterLogo(size: 70),
        ]
      )
    );
  }
}