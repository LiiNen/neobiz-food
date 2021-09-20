import 'package:flutter/material.dart';

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
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pop(context);
        },
        // todo: back icon
      ),
      actions: [

      ]
    );
  }
}