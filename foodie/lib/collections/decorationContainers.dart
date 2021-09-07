import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';

class LoginViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  LoginViewAppBar({required this.title}) : preferredSize = Size.fromHeight(56.0);
  @override
  final Size preferredSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      brightness: Brightness.light,
      backgroundColor: const Color(0xffffffff),
      centerTitle: true,
      title: Text(title, style: textStyle(weight: 500, size: 16.0),)
    );
  }
}

lineDivider({color: const Color(0xffe8e8e8)}) {
  return Container(
    height: 1,
    decoration: BoxDecoration(
      border: Border.all(
        color: color,
        width: 1
      )
    )
  );
}