import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodie/adMob/adMobItem.dart';
import 'package:foodie/collections/functions.dart';

class HomeBannerContainer extends StatefulWidget {
  @override
  State<HomeBannerContainer> createState() => _HomeBannerContainer();
}
class _HomeBannerContainer extends State<HomeBannerContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        child: Swiper(
          autoplay: true,
          pagination: swiperPagination(),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return AdMobBanner();
          },
        )
      )
    );
  }
}