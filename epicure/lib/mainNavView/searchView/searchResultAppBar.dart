import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchResultAppBar extends StatelessWidget implements PreferredSizeWidget{
  SearchResultAppBar({required this.title}) : preferredSize = Size.fromHeight(58.0);
  @override
  final Size preferredSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 26, height: 26,
                child: Center(
                  child: SvgPicture.asset('asset/svgIcon/icoBack.svg', width: 6.5, height: 13)
                )
              )
            ),
            SizedBox(width: 11),
            Text(title, style: TextStyle(color: Colors.black),)
          ]
        )
      ),
    );
  }
}
