import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie/collections/functions.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  DefaultAppBar({required this.title, this.elevation=true}) : preferredSize = Size.fromHeight(56.0);
  @override
  final Size preferredSize;
  final String title;
  final bool elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffffffff),
      centerTitle: true,
      elevation: elevation ? 1.0 : 0,
      shadowColor: elevation ? Colors.black: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 16, height: 32,
              child: Center(child: SvgPicture.asset('asset/svgIcon/icoBack.svg', width: 8, height: 16,))
            )
          ),
          Text(title, style: textStyle(color: Colors.black, weight: 500, size: 16.0),),
          Container(width: 16)
        ]
      ),
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