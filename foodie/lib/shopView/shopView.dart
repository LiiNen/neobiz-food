import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/restApi/detailInfoApi.dart';
import 'package:foodie/shopView/shopViewAppBar.dart';

import 'shopViewTabBar/shopViewTabBar.dart';

class ShopView extends StatefulWidget {
  final int shopNo;
  final String infoText;
  ShopView({required this.shopNo, required this.infoText});

  @override
  State<ShopView> createState() => _ShopView(shopNo: shopNo, infoText: infoText);
}
class _ShopView extends State<ShopView> with SingleTickerProviderStateMixin {
  int shopNo;
  String infoText;
  _ShopView({required this.shopNo, required this.infoText});
  var shopJson;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    _getShopInfo();
    controller = TabController(length: 3, vsync: this, initialIndex: 0);
    controller.addListener(_controllerListener);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _controllerListener() {
    if(controller.indexIsChanging) setState(() {});
  }

  void _getShopInfo() async {
    var temp = await detailInfo(no: shopNo);
    setState(() {
      shopJson = temp;
    });
    for(final key in shopJson.keys) {
      print(key);
      print(shopJson[key]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ShopViewAppBar(shopNo: shopNo),
      body: shopJson == null ? Container() : ListView(
        padding: EdgeInsets.only(top: 0),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          shopPhotoSwiper(),
          infoBox(),
          SizedBox(height: 8),
          exportBox(),
          ShopViewTabBar(controller: controller),
          shopTabBarView(controller: controller, shopJson: shopJson)
        ]
      )
    );
  }

  shopPhotoSwiper() {
    var photoList = shopJson['photo'];
    return Container(
      height: MediaQuery.of(context).size.width * 0.75,
      child: Swiper(
        autoplay: false,
        pagination: swiperPagination(),
        itemCount: photoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: photoList[index] is String ?
            Image.network(
              photoList[index],
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Center(child: FlutterLogo(size: 40));
              },
              fit: BoxFit.fill,
            ) : Center(child: FlutterLogo(size: 40))
          );
        },
      )
    );
  }

  infoBox() {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(shopJson['name']),
            SizedBox(height: 3),
            Text(infoText),
            SizedBox(height: 21),
            Text('푸디로그 평점(AAA) 오감 평점(5점)'),
            SizedBox(height: 21),
          ]
        )
      )
    );
  }

  exportBox() {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 31),
        child: Column(
          children: [
            // todo : export items
          ]
        )
      )
    );
  }
}