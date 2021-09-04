import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';

import 'localView/localView.dart';
import 'subwayView/subwayView.dart';
import 'townView/townView.dart';
import 'settingView/settingView.dart';

class MainGridItem {
  String title;
  Icon icon;
  Widget? route;
  MainGridItem({required this.title, required this.icon, this.route});
}
List<MainGridItem> _mainGridItemList = [
  MainGridItem(title: '지역별', icon: Icon(Icons.location_on), route: LocalView()),
  MainGridItem(title: '역세권', icon: Icon(Icons.directions_subway), route: SubwayView()),
  MainGridItem(title: '맛집촌', icon: Icon(Icons.flag), route: TownView()),
  MainGridItem(title: '내주변', icon: Icon(Icons.map_outlined)),
  MainGridItem(title: '찜한 맛집', icon: Icon(Icons.star)),
  MainGridItem(title: '설정', icon: Icon(Icons.settings), route: SettingView()),
];


class MainGridView extends StatefulWidget {
  @override
  State<MainGridView> createState() => _MainGridView();
}
class _MainGridView extends State<MainGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(_mainGridItemList.length, (index) {
          return Container(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                print(_mainGridItemList[index].title);
                navigatorPush(context: context, route: _mainGridItemList[index].route!);
              },
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_mainGridItemList[index].title),
                      _mainGridItemList[index].icon
                    ],
                  )
              )
            )
          );
        }),
      )
    );
  }
}