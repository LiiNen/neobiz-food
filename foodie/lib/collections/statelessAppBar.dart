import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  DefaultAppBar({required this.title}) : preferredSize = Size.fromHeight(56.0);
  @override
  final Size preferredSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        backgroundColor: const Color(0xffffffff),
        centerTitle: true,
        title: Text(title, style: textStyle(weight: 500, size: 16.0),)
    );
  }
}

class HomeViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeViewAppBar({this.title}) : preferredSize = Size.fromHeight(56.0);

  final String? title;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text('foodie', style: textStyle(color: Colors.black, weight: 400, size: 14.0)),
    );
  }
}