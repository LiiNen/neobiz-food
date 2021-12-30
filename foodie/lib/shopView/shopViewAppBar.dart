import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/collections/decorationContainers.dart';

class ShopViewAppBar extends StatefulWidget implements PreferredSizeWidget {
  ShopViewAppBar({required this.shopNo}) : preferredSize = Size.fromHeight(56.0);
  @override
  final Size preferredSize;
  final int shopNo;

  @override
  State<ShopViewAppBar> createState() => _ShopViewAppBar(shopNo: shopNo);
}
class _ShopViewAppBar extends State<ShopViewAppBar> {
  _ShopViewAppBar({required this.shopNo});
  int shopNo;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: serviceColor(),
      elevation: 0,
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
              child: Center(child: SvgPicture.asset('asset/svgIcon/icoBackWhite.svg', width: 8, height: 16,))
            )
          ),
          Image.asset('asset/image/logoSplash.png', width: 113),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 16, height: 32,
              child: Center(child: Image.asset('asset/image/icoShareWhite.png', width: 21.2))
            )
          ),
        ]
      ),
    );
  }
}