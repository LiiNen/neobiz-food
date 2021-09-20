import 'package:flutter/material.dart';

class ShopViewTabLocation extends StatefulWidget {
  @override
  State<ShopViewTabLocation> createState() => _ShopViewTabLocation();
}
class _ShopViewTabLocation extends State<ShopViewTabLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, height: 300,
      color: Colors.red
    );
  }
}