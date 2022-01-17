import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/restApi/detailInfoApi.dart';
import 'package:foodie/restApi/shopApi.dart';
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
  late TabController _tabController;
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;
  bool _isScrolled = false;
  GlobalKey _scrollInvisibleKey = GlobalKey();
  late double _scrollInvisibleHeight;

  @override
  void initState() {
    super.initState();
    _getShop();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_tabListener);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _tabListener() {
    if(_tabController.indexIsChanging) setState(() {
      if(_isScrolled) _scrollController.jumpTo(0);
    });
  }
  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      print(_scrollPosition);
      if(!_isScrolled && _scrollPosition > _scrollInvisibleHeight) {
        _isScrolled = true;
      }
      else if(_isScrolled && _scrollPosition < 0) {
        _scrollController = ScrollController(initialScrollOffset: _scrollInvisibleHeight);
        _scrollController.addListener(_scrollListener);
        _isScrolled = false;
      }
    });
  }

  void _getShop() async {
    var temp = await getShop(id: shopNo);
    setState(() {
      shopJson = temp;
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _scrollInvisibleHeight = getSizeWithKey(_scrollInvisibleKey).height;
        _scrollController.addListener(_scrollListener);
      });
    });
    for(final key in shopJson.keys) {
      print(key);
      print(shopJson[key]);
    }
  }

  void _getShopInfo() async {
    var temp = await detailInfo(no: shopNo);
    setState(() {
      shopJson = temp;
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _scrollInvisibleHeight = getSizeWithKey(_scrollInvisibleKey).height;
        _scrollController.addListener(_scrollListener);
      });
    });
    for(final key in shopJson.keys) {
      print(key);
      print(shopJson[key]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopViewAppBar(shopNo: shopNo),
      backgroundColor: Color(0xfffcfcfc),
      body: shopJson == null ? Container() : !_isScrolled ? SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            scrollInvisibleColumn(),
            scrollVisibleColumn(),
          ]
        )
      ) : Column(
        children: [
          ShopViewTabBar(controller: _tabController),
          Expanded(child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                shopTabBarView(controller: _tabController, shopJson: shopJson)
              ]
            )
          ))
        ]
      )
    );
  }

  scrollInvisibleColumn() {
    return Column(
      key: _scrollInvisibleKey,
      children: [
        shopPhotoSwiper(),
        infoBox(),
        lineDivider(),
        positionBox(),
        SizedBox(height: 12),
        actionBoxList(),
        SizedBox(height: 17),
        exportBox(),
        SizedBox(height: 42),
      ]
    );
  }
  scrollVisibleColumn() {
    return Column(
      children: [
        ShopViewTabBar(controller: _tabController),
        shopTabBarView(controller: _tabController, shopJson: shopJson)
      ]
    );
  }

  shopPhotoSwiper() {
    var photoList = [shopJson['shopImage']] + json.decode(shopJson['menuImages']);
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
      color: Color(0xfffcfcfc),
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
                Text(shopJson['shopName'], style: textStyle(weight: 500, size: 18.0)),
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
          SizedBox(height: 4),
          Row(
            children: [
              Container(
                width: 56, height: 24,
                child: Center(
                  child: Text('도로명', style: textStyle(color: Colors.white, weight: 500, size: 12.0))
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  color: Color(0xffbababa)
                ),
              ),
              SizedBox(width: 5),
              Text(shopJson['roadAddress'], style: textStyle(color: Color(0xff888888), weight: 400, size: 14.0))
            ]
          ),
          SizedBox(height: 9),
          Text('전화번호', style: textStyle(color: Color(0xff4d4d4d), weight: 500, size: 15.0)),
          SizedBox(height: 2),
          Text(shopJson['phone'], style: textStyle(color: Color(0xff393939), weight: 400, size: 14.0)),
        ]
      )
    );
  }

  actionBoxList() {
    var actionList = [
      {'type': 'Navi', 'title': '네비게이션', 'src': '', 'callback': () {print('navi');}},
      {'type': 'Taxi', 'title': '카카오 택시', 'src': '', 'callback': () {print('taxi');}},
      {'type': 'Bus', 'title': '카카오 버스', 'src': '', 'callback': () {print('bus');}},
      {'type': 'Favorite', 'title': '찜하기', 'src': '', 'callback': () {print('fav');}}
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: List.generate(actionList.length, (index) {
          return actionBox(actionList[index]);
        })
      )
    );
  }

  actionBox(action) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              action['callback'];
            },
            child: Image.asset('asset/image/info${action['type']}Button.png', width: 49),
          ),
          SizedBox(height: 11),
          Text(action['title'], style: textStyle(weight: 500, size: 13.0))
        ]
      )
    );
  }

  exportBox() {
    return Container(
      color: Color(0xfffcfcfc),
      child: Container(
        width: MediaQuery.of(context).size.width,
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