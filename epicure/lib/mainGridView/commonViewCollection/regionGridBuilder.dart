import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainGridView/localView/localRegionSearchView.dart';
import 'package:foodie/mainNavView/searchView/subwayView/subwayLineRegionSearchView.dart';
import 'package:foodie/mainNavView/searchView/subwayView/subwayView.dart';

class RegionGridBuilder extends StatefulWidget{
  final List regionList;
  final bool isLocal;
  final bool isSubway;
  final Map routerComponent;
  RegionGridBuilder({required this.regionList, this.isLocal=false, this.isSubway=false, required this.routerComponent});
  @override
  State<RegionGridBuilder> createState() => _RegionGridBuilder(regionList: regionList, isLocal: isLocal, isSubway: isSubway, routerComponent: routerComponent);
}
class _RegionGridBuilder extends State<RegionGridBuilder> {
  List regionList;
  bool isLocal;
  bool isSubway;
  Map routerComponent;
  _RegionGridBuilder({required this.regionList, required this.isLocal, required this.isSubway, required this.routerComponent});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3,
        children: List.generate(regionList.length, (index) {
          return Container(
            child: Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      print(regionList[index]);
                      if(isLocal) navigatorPush(context: context, route: LocalRegionSearchView(title: '${routerComponent['title']} ${regionList[index]['name']}', titleIndex: routerComponent['titleIndex'], region: regionList[index]['name']));
                      else if(isSubway) navigatorPush(context: context, route: SubwayLineRegionSearchView(title: '${routerComponent['title']} ${regionList[index]['name']}', subwayQuery: subwayQuery(areaNo: routerComponent['areaNo'], lineNo: routerComponent['lineNo'], stationNo: regionList[index]['no'])));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(regionList[index]['name']),
                        Text(regionList[index]['count'].toString())
                      ]
                    )
                  )
                )
              ]
            )
          );
        })
      ),
    );
  }
}