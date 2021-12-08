import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
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
          lineDivider(),
          positionBox(),
          SizedBox(height: 12),
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
        margin: EdgeInsets.symmetric(vertical: 24),
        padding: EdgeInsets.only(left: 18, right: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shopJson['name'], style: textStyle(weight: 500, size: 18.0)),
                Image.asset('asset/image/star3.png', height: 30),
              ]
            ),
            Text(infoText, style: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 15.0)),
            SizedBox(height: 12),
            Row(
              children: [
                Text('전문가 평점', style: textStyle(color: Color(0xff4d4d4d), weight: 400, size: 15.0)),
                SizedBox(width: 8),
                coloredBox('AAA'),
                SizedBox(width: 22),
                Text('방문자 평점', style: textStyle(color: Color(0xff4d4d4d), weight: 400, size: 15.0)),
                SizedBox(width: 8),
                coloredBox('5.0'),
              ]
            ),
          ]
        )
      )
    );
  }

  coloredBox(text) {
    return Container(
      width: 46,
      height: 23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        color: Color(0xffff851c)
      ),
      child: Center(
        child: Text(text, style: textStyle(color: Colors.white, weight: 400, size: 15.0))
      )
    );
  }

  positionBox() {
    return Container(
      color: Color(0xfffcfcfc),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('주소', style: textStyle(color: Color(0xff4d4d4d), weight: 500, size: 15.0)),
          SizedBox(height: 2),
          Text(shopJson['address'], style: textStyle(color: Color(0xff393939), weight: 400, size: 14.0)),
          //todo : 도로명주소????
          SizedBox(height: 9),
          Text('전화번호', style: textStyle(color: Color(0xff4d4d4d), weight: 500, size: 15.0)),
          SizedBox(height: 2),
          Text(shopJson['phone'], style: textStyle(color: Color(0xff393939), weight: 400, size: 14.0)),
        ]
      )
    );
  }

  exportBox() {
    return Container(
      color: Color(0xfffcfcfc),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            fullWidthShadowButton('전화걸기', callPhone)
          ]
        )
      )
    );
  }

  callPhone() {
    print('todo: phone call');
  }
}