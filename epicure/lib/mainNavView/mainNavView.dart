import 'package:flutter/material.dart';
import 'package:foodie/collections/asyncFunctions.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainGridView/localView/localView.dart';
import 'package:foodie/mainGridView/scrapView/scrapView.dart';
import 'package:foodie/mainGridView/settingView/settingView.dart';
import 'package:foodie/mainGridView/subwayView/subwayView.dart';
import 'package:foodie/mainGridView/townView/townView.dart';

import 'homeView/homeView.dart';

class MainNavView extends StatefulWidget {
  @override
  State<MainNavView> createState() => _MainNavView();
}
class _MainNavView extends State<MainNavView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xff0958c5),
          unselectedItemColor: Color(0xffd1d5d9),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          onTap: (int index){
            setState(() {
              _selectedIndex = index;
              showToast('index $index');
            });
          },
          items: [
            BottomNavigationBarItem(label: 'HOME', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'EXPLORE', icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: 'MAP', icon: Icon(Icons.location_on)),
            BottomNavigationBarItem(label: 'HISTORY', icon: Icon(Icons.access_time_rounded)),
            BottomNavigationBarItem(label: 'TOWN', icon: Icon(Icons.people)),
            BottomNavigationBarItem(label: 'MY', icon: Icon(Icons.person_rounded))
          ],
        ),
        body: Center(
          child: _navItemView.elementAt(_selectedIndex),
        ),
      )
    );
  }

  // navigation items view
  List<Widget> _navItemView = <Widget>[
    HomeView(),
    LocalView(),
    SubwayView(),
    ScrapView(),
    TownView(),
    SettingView(),
  ];
}