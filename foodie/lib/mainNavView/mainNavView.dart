import 'package:flutter/material.dart';
import 'package:foodie/collections/exitDialog.dart';
import 'package:foodie/mainNavView/searchPositionView/searchPositionView.dart';

import 'homeView/homeView.dart';
import 'searchView/searchView.dart';
import 'favoriteView/favoriteView.dart';
import 'userView/userView.dart';

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
            BottomNavigationBarItem(label: '홈', icon: Container(
              margin: EdgeInsets.only(bottom: 6, top: 6),
              child: _selectedIndex == 0 ? Image.asset('asset/image/navHomeSelect.png', width: 23.5) : Image.asset('asset/image/navHomeUnselect.png', width: 23.5))
            ),
            BottomNavigationBarItem(label: '검색', icon: Container(
              margin: EdgeInsets.only(bottom: 6, top: 6),
              child: _selectedIndex == 1 ? Image.asset('asset/image/navHomeSelect.png', width: 23.5) : Image.asset('asset/image/navHomeUnselect.png', width: 23.5))
            ),
            BottomNavigationBarItem(label: '내주변', icon: Container(
              margin: EdgeInsets.only(bottom: 6, top: 6),
              child: _selectedIndex == 2 ? Image.asset('asset/image/navLocationSelect.png', width: 20.8) : Image.asset('asset/image/navLocationUnselect.png', width: 20.8))
            ),
            BottomNavigationBarItem(label: 'MY', icon: Container(
              margin: EdgeInsets.only(bottom: 6, top: 6),
              child: _selectedIndex == 3 ? Image.asset('asset/image/navUserSelect.png', width: 20) : Image.asset('asset/image/navUserUnselect.png', width: 20))
            ),
            BottomNavigationBarItem(label: '찜', icon: Container(
              margin: EdgeInsets.only(bottom: 6, top: 6),
              child: _selectedIndex == 4 ? Image.asset('asset/image/navFavoriteUnselect.png', width: 16.5) : Image.asset('asset/image/navFavoriteUnselect.png', width: 16.5))
            )
          ],
          selectedItemColor: Color(0xffff851c),
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
    SearchPositionView(),
    UserView(),
    FavoriteView(),
  ];
}