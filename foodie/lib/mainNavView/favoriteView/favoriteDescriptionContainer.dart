import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';

class FavoriteDescriptionItem {
  String title;
  String src;
  FavoriteDescriptionItem(this.title, this.src);
}

class FavoriteDescriptionContainer extends StatelessWidget {

  final List<FavoriteDescriptionItem> favoriteDescriptionItem = [
    FavoriteDescriptionItem('이례적으로 독보적인 맛과 솜씨를 가진 식도락 성지', 'asset/image/star3.png'),
    FavoriteDescriptionItem('탁월한 맛으로 존재감이 돋보이는 식도락 순례지', 'asset/image/star2.png'),
    FavoriteDescriptionItem('참신한 맛과 나름의 매력을 지닌 집', 'asset/image/star1.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Image.asset('asset/image/favoriteDescription.png'),
          SizedBox(height: 21),
          starListContainer(),
          SizedBox(height: 21),
          lineDivider(),
          SizedBox(height: 20),
          Image.asset('asset/image/logo.png', width: MediaQuery.of(context).size.width/2.72),
        ]
      )
    );
  }

  starListContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          starBox(0),
          SizedBox(height: 12.5),
          starBox(1),
          SizedBox(height: 12.5),
          starBox(2),
        ]
      )
    );
  }

  starBox(int index) {
    var item = favoriteDescriptionItem[index];
    return Container(
      child: Row(
        children: [
          Image.asset(item.src, width: 77.5, height: 30.5),
          SizedBox(width: 11),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1),
              Text(item.title, style: textStyle(color: Color(0xff808080), weight: 500, size: 11.0))
            ]
          )
        ]
      )
    );
  }
}