import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/collections/functions.dart';

class SearchPositionAppBar extends StatelessWidget implements PreferredSizeWidget {
  SearchPositionAppBar({required this.title, this.back=true, this.callback}) : preferredSize = Size.fromHeight(56.0);
  @override
  final Size preferredSize;
  final String title;
  final bool back;
  final dynamic callback;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          back ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 16, height: 32,
              child: Center(child: SvgPicture.asset('asset/svgIcon/icoBack.svg', width: 8, height: 16,))
            )
          ) : Container(width: 16),
          Text(title, style: textStyle(color: Colors.black, weight: 700, size: 16.0),),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              callback();
            },
            child: Container(
              width: 16, height: 58,
              child: Center(
                child: Image.asset('asset/image/searchFilter.png', width: 22),
              )
            )
          )
        ]
      )
    );
  }
}