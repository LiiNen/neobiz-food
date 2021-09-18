import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
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
          townBuilder()
        ]
      )
    );
  }

  townBuilder() {
    return Expanded(child: Container(
      margin: marginLR(vertical: 20),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2,
        mainAxisSpacing: 12, crossAxisSpacing: 8,
        children: List.generate(townList.length, (index) {
          var _town = townList[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                navigatorPush(context: context, route: TownSearchView(title: _town['name'], titleIndex: _town['no']));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_town['name'], style: textStyle(color: Color(0xff191919), weight: 600, size: 14.0),),
                  SizedBox(width: 2),
                  Text(_town['count'].toString(), style: textStyle(color: Color(0xff191919), weight: 400, size: 12.0))
                ],
              )
            )
          );
        }),
      )
    ));
  }
}