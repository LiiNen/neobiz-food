import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/restApi/detailInfoApi.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailView extends StatefulWidget {
  final int no;
  DetailView({required this.no});
  @override
  State<DetailView> createState() => _DetailView(no: no);
}
class _DetailView extends State<DetailView> {
  int no;
  _DetailView({required this.no});

  var detailJson;

  @override
  void initState() {
    super.initState();
    getDetailInfo(no);
  }

  /// detailJson : json
  /// photo: List<String>
  /// blog: List<Json>, blog[index]: title String, description String, link String
  /// map: markerX double, marketY double,
  /// name: String, alias: String, rank: int,
  /// explain: String with HTML tag(p, br),
  /// menu: String, pre_cost: String,
  /// address: String, phone: 000-000-0000,
  /// search_road: String,
  /// time: 00:00~00:00, rest_day: String,
  /// park: String, reservation: String, homepage: String, rec_menu: String
  void getDetailInfo(int no) async {
    detailJson = await detailInfo(no: no);
    for(final key in detailJson.keys) {
      print(key);
      print(detailJson[key]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(detailTitle: detailJson != null ? detailJson['name'] : '맛집 불러오는 중...'),
      body: detailJson == null ? Center(child: CircularProgressIndicator(strokeWidth: 10,))
        : (
        Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: [
                  detailPhotoSwiper(),
                  menuContainer(),
                  blogContainer(),
                ]
              )
            ]
          )
        )
      )
    );
  }

  detailPhotoSwiper() {
    var photoList = detailJson['photo'];
    bool loop = photoList.length == 1 ? false : true;
    return Container(
      height: 360,
      child: Swiper(
        loop: loop,
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

  menuContainer() {
    return Container(
      child: Column(
        children: [
          rowObject('메뉴가격', detailJson['menu']),
          rowObject('예산', detailJson['pre_cost']),
          rowObject('주소', detailJson['address']),
          rowObject('전화번호', detailJson['phone']),
          rowObject('찾아가는길', detailJson['search_road']),
          rowObject('영업시간', detailJson['time']),
          rowObject('쉬는날', detailJson['rest_day']),
          rowObject('주차장', detailJson['park']),
          rowObject('예약', detailJson['reservation']),
          rowObject('홈페이지', detailJson['homepage']),
        ]
      )
    );
  }

  rowObject(String title, String context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            child: Text(title, style: textStyle(color: Colors.red), textAlign: TextAlign.left,)
          ),
          Expanded(
            child: (title=='홈페이지' && context != '' ?
              GestureDetector(
                onTap: () {launch(context);},
                child: Text(context, style: textStyle(color: Colors.blue,))
              ) :
              Container(
                child: Text(context != '' ? context : '정보없음', style: textStyle(), textAlign: TextAlign.left,)
              )
            )
          )
        ]
      )
    );
  }

  blogContainer() {
    var blogList = detailJson['blog'];
    var blogContainerList = List<Widget>.generate(blogList.length, (index) {
      var _blog = blogList[index];
      return GestureDetector(
        onTap: () {launch(_blog['link']);},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_blog['title'], style: textStyle(weight: 700), overflow: TextOverflow.ellipsis),
            Text(_blog['description'], style: textStyle(), maxLines: 5,)
          ]
        )
      );
    });
    return Container(
      child: Column(
        children: blogContainerList
      )
    );
  }
}