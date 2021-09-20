import 'package:flutter/material.dart';

class ShopViewTabInfo extends StatefulWidget {
  @override
  State<ShopViewTabInfo> createState() => _ShopViewTabInfo();
}
class _ShopViewTabInfo extends State<ShopViewTabInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, height: 300,
      color: Colors.white
    );
  }
}