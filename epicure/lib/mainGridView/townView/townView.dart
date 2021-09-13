import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/restApi/searchTownApi.dart';

import 'townSearchView.dart';

class TownView extends StatefulWidget {
  @override
  State<TownView> createState() => _TownView();
}
class _TownView extends State<TownView> {
  var townList = [];

  @override
  void initState() {
    super.initState();
    getTown();
  }

  /// townList : List
  /// townList[index] : {no: int, name: String, count: int}
  getTown() async {
    var temp = await searchTown(townNo: -1, mode: 'region', presetBody: presetRequestBody());
    townList = temp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          MainTitleBar(title: '맛집촌'),
          townBuilder()
        ],
      )
    );
  }

  townBuilder() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(townList.length, (index) {
          var _town = townList[index];
          return Container(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                navigatorPush(context: context, route: TownSearchView(title: _town['name'], titleIndex: _town['no']));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_town['name'], style: textStyle(weight: 700, size: 16.0),),
                  Text(_town['count'].toString(), style: textStyle(color: Colors.red, weight: 400, size: 12.0))
                ],
              )
            )
          );
        }),
      )
    );
  }
}