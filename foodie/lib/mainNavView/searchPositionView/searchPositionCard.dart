import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';

class SearchPositionCard extends StatelessWidget {
  SearchPositionCard({required this.title, required this.genre, required this.position});
  final String title;
  final String genre;
  final String position;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width, height: 82,
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(aspectRatio: 1.34, child: Image.asset('asset/image/paymentKakao.png', width: 110, height: 82)),
              SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: textStyle(weight: 500, size: 16.0)),
                  SizedBox(height: 1),
                  Text(genre, style: textStyle(weight: 400, size: 13.0)),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(position, style: textStyle(weight: 400, size: 13.0)),
                      // button
                    ]
                  )
                ]
              )
            ]
          )
        )
      )
    );
  }
}