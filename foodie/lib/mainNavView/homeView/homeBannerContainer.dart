import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodie/collections/decorationContainers.dart';

class HomeBannerContainer extends StatefulWidget {
  @override
  State<HomeBannerContainer> createState() => _HomeBannerContainer();
}
class _HomeBannerContainer extends State<HomeBannerContainer> {

  List _bannerItemList = [];

  @override
  void initState() {
    super.initState();
    _bannerItemList.add(1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 168,
      child: Swiper(
        pagination: swiperPagination(),
        itemCount: _bannerItemList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Center(
                child: FlutterLogo(size: 30),
              )
            )
          );
        }
      )
    );
  }
}
