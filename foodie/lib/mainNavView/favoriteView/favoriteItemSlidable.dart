import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';

class FavoriteItemSlidable extends StatelessWidget {
  final int shopId;
  final String title;
  final String genre;
  final String position;
  final String thumbnail;
  final String rating;
  final dynamic pushCallback;
  final dynamic shareCallback;
  final dynamic deleteCallback;
  FavoriteItemSlidable({required int this.shopId, required String this.title,
    required String this.genre, required String this.position, required this.thumbnail, required String this.rating,
    dynamic this.pushCallback, dynamic this.shareCallback, dynamic this.deleteCallback});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      direction: Axis.horizontal,
      actionPane: SlidableScrollActionPane(),
      actionExtentRatio: 0.6,
      secondaryActions: [_iconSlideAction()],
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {pushCallback();},
          child: Container(
            width: MediaQuery.of(context).size.width, height: 82,
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(aspectRatio: 1.34, child: Image.network(thumbnail, width: 110, height: 82)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: textStyle(weight: 500, size: 16.0)),
                        SizedBox(height: 1),
                        Text(genre, style: textStyle(weight: 400, size: 13.0)),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 20,
                              child: Text(position, style: textStyle(weight: 400, size: 13.0), textAlign: TextAlign.left,)
                            ),
                            rating == '' ? Container() : Image.asset('asset/image/star${rating.length}.png', height: 20)
                          ]
                        )
                      ]
                    )
                  )
                ]
              )
            )
          )
        )
    );
  }

  _iconSlideAction() {
    return IconSlideAction(
      color: Color(0xfffafafa),
      onTap: () {

      },
      iconWidget: Container(
        child: Row(
          children: [
            lineDivider(vertical: true),
            Expanded(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('asset/image/icoFavoriteShare.png', width: 23),
                    SizedBox(height: 8.6),
                    Text('공유', style: textStyle(color: Color(0xff383838), weight: 500, size: 13.0))
                  ]
                )
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 14, bottom: 13),
              child: lineDivider(vertical: true, color: Color(0xffd3d3d3)),
            ),
            Expanded(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('asset/image/icoFavoriteDelete.png', width: 23),
                    SizedBox(height: 7.1),
                    Text('삭제', style: textStyle(color: Color(0xff383838), weight: 500, size: 13.0))
                  ]
                )
              )
            ),
          ]
        )
      ),
    );
  }
}