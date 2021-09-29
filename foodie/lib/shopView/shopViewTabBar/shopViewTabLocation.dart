import 'package:flutter/material.dart';

class ShopViewTabLocation extends StatefulWidget {
  final dynamic shopJson;
  ShopViewTabLocation(this.shopJson);

  @override
  State<ShopViewTabLocation> createState() => _ShopViewTabLocation(shopJson);
}
class _ShopViewTabLocation extends State<ShopViewTabLocation> {
  dynamic shopJson;
  _ShopViewTabLocation(this.shopJson);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, height: 300,
      color: Colors.red
    );
  }
}