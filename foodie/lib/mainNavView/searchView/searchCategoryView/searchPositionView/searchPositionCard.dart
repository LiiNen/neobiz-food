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
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: Color(0xffededed), width: 1),
          color: Colors.white
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
        )
      )
    );
  }
}