import 'package:flutter/material.dart';
import 'package:foodie/collections/exitDialog.dart';

import 'homeView/homeView.dart';
import 'searchView/searchView.dart';
import 'favoriteView/favoriteView.dart';
import 'userView/userView.dart';
import 'settingView/settingView.dart';

class MainNavView extends StatefulWidget {
  @override
  State<MainNavView> createState() => _MainNavView();
}
class _MainNavView extends State<MainNavView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitDialog(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(label: '홈', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: '검색', icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: '찜', icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(label: 'MY', icon: Icon(Icons.person_rounded)),
            BottomNavigationBarItem(label: '설정', icon: Icon(Icons.settings_rounded))
          ],
          selectedItemColor: Colors.black,
        ),
        body: Center(
          child: _mainNavItemView.elementAt(_selectedIndex),
        ),
      )
    );
  }

  List<Widget> _mainNavItemView = <Widget>[
    HomeView(),
    SearchView(),
    FavoriteView(),
    UserView(),
    SettingView(),
  ];
}