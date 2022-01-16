import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/mainNavView/favoriteView/favoriteDescriptionContainer.dart';
import 'package:foodie/restApi/favoriteApi.dart';

import 'favoriteList.dart';

class FavoriteView extends StatefulWidget {
  @override
  State<FavoriteView> createState() => _FavoriteView();
}
class _FavoriteView extends State<FavoriteView> with SingleTickerProviderStateMixin{
  var _isRed = true;

  var _favoriteList = [];

  @override
  void initState() {
    super.initState();
    _getFavoriteList();
  }

  void _getFavoriteList() async {
    _favoriteList = await getFavoriteShopList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '찜한목록', back: false),
      backgroundColor: Color(0xfffcfcfc),
      body: Column(
        children: [
          SizedBox(height: 25),
          resultTabBar(),
          SizedBox(height: 21),
          lineDivider(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    _isRed ? FavoriteRedList(_favoriteList) : FavoriteGreenList(_favoriteList),
                    FavoriteDescriptionContainer(),
                  ]
                )
              )
            )
          )
        ]
      )
    );
  }

  resultTabBar() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              tabBarColor('red'),
              SizedBox(width: 8),
              tabBarColor('green'),
            ]
          )
        ],
      )
    );
  }

  tabBarColor(String color) {
    bool _selected = (color == 'red' && _isRed) || (color == 'green' && !_isRed);
    return GestureDetector(
      onTap: () {
        setState(() {
          if(color == 'red') _isRed = true;
          else if(color == 'green') _isRed = false;
        });
      },
      child: Container(
        width: 96, height: 32,
        decoration: BoxDecoration(
          color: _selected ? color=='red' ? serviceColor() : Color(0xff66af6e) : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: _selected ? color=='red' ? serviceColor() : Color(0xff66af6e) : Color(0xffededed), width: 1)
        ),
        child: Center(child: Text(color == 'red' ? '레드리스트' : '그린리스트', style: _selected ?
          textStyle(color: Colors.white, weight: 700, size: 14.0) :
          textStyle(color: Color(0xff8e8e8e), weight: 500, size: 14.0)
        ))
      )
    );
  }
}