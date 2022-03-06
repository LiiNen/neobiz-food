import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/mainNavView/searchView/searchResultView.dart';
import 'package:foodie/restApi/presetRequestBody.dart';
import 'package:foodie/restApi/regionApi.dart';
import 'package:foodie/restApi/searchTownApi.dart';

class SearchTownView extends StatefulWidget {
  @override
  State<SearchTownView> createState() => _SearchTownView();
}
class _SearchTownView extends State<SearchTownView> {
  var _townList = [];

  @override
  void initState() {
    super.initState();
    _getTown();
  }

  _getTown() async {
    var _temp = await getRegionTown();
    if(_temp != null) {
      setState(() {
        _townList = _temp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          children: List.generate((_townList.length/2).ceil() + 2, (index) {
            if(index == 0) return SizedBox(height: 10);
            else if(index == (_townList.length/2).ceil() + 1) return SizedBox(height: 18);
            return Row(
              children: [
                _townCard((index-1)*2),
                SizedBox(width: 16),
                _townCard((index-1)*2+1),
              ]
            );
          })
        )
      )
    );
  }

  _townCard(int index) {
    if(index == _townList.length) return Expanded(child: Container());
    else return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          navigatorPush(context: context, widget: SearchResultView(title: _townList[index]['districtName'], searchType: 'town', requestItem: null, regionId: _townList[index]['regionId'],));
          //todo: push with id
          // navigatorPush(
          //   context: context,
          //   widget: SearchResultView(
          //     title: _townList[index]['districtName'],
          //     searchType: 'town',
          //     requestItem: {'townNo': _townList[index]['regionId']}
          //   )
          // );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 21),
          child: AspectRatio(
            aspectRatio: 3.7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                // border: Border.all(color: Color(0xffededed), width: 1),
                boxShadow: [BoxShadow(
                  color: Color(0x45dbdbdb),
                  offset: Offset(3,3),
                  blurRadius: 5,
                  spreadRadius: 0
                )],
                color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_townList[index]['districtName'], style: textStyle(color: Colors.black, weight: 500, size: 14.0)),
                  SizedBox(width: 4),
                  Text(_townList[index]['districtCount'].toString(), style: textStyle(color: Color(0xffc4c4c4), weight: 700, size: 14.0))
                ]
              )
            )
          )
        )
      )
    );
  }
}