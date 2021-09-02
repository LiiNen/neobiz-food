import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/main.dart';
import 'package:foodie/restApi/detailInfoApi.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

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
      appBar: MainAppBar(),
      body: detailJson == null ? Center(child: CircularProgressIndicator(strokeWidth: 10,))
        : (
        Column(
          children: <Widget>[
            MainTitleBar(title: detailJson['name']),
            detailPhotoSwiper()
          ]
        )
      )
    );
  }

  detailPhotoSwiper() {
    var photoList = detailJson['photo'];
    bool loop = photoList.length == 1 ? false : true;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160,
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
}