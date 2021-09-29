import 'package:flutter/material.dart';

class ShopViewTabReview extends StatefulWidget {
  final dynamic shopJson;
  ShopViewTabReview(this.shopJson);

  @override
  State<ShopViewTabReview> createState() => _ShopViewTabReview(shopJson);
}
class _ShopViewTabReview extends State<ShopViewTabReview> {
  dynamic shopJson;
  _ShopViewTabReview(this.shopJson);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, height: 300,
      color: Colors.black,
    );
  }
}