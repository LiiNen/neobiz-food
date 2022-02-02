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
    _bannerItemList.add(1);
    _bannerItemList.add(1);
  }

  @override
  Widget build(BuildContext context) {
    var swiperWidth = MediaQuery.of(context).size.width * 5/6;
    var swiperHeight = MediaQuery.of(context).size.width * 1/2;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: swiperHeight+32,
      child: Swiper(
        layout: SwiperLayout.CUSTOM,
        customLayoutOption:
        new CustomLayoutOption(startIndex: -1, stateCount: _bannerItemList.length).addTranslate([
          new Offset((swiperWidth+16) * (-1), 0),
          new Offset(0, 0),
          new Offset((swiperWidth+16), 0) //for right element
        ]),
        itemWidth: swiperWidth,
        itemHeight: swiperHeight+32,
        pagination: swiperPagination(),
        autoplay: true,
        itemCount: _bannerItemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                child: Image.asset('asset/image/banner${index+1}.png', fit: BoxFit.fill,)
              )
            )
          );
        }
      )
    );
  }
}
