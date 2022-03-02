import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/shopView/shopView.dart';

class ShopListContainer extends StatefulWidget {
  final List<dynamic> shopObjectList;
  ShopListContainer({required this.shopObjectList});
  @override
  State<ShopListContainer> createState() => _ShopListContainer(shopObjectList);
}
class _ShopListContainer extends State<ShopListContainer> {
  List<dynamic> shopObjectList;
  _ShopListContainer(this.shopObjectList);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: List.generate(shopObjectList.length, (index) {
          var _shopObject = shopObjectList[index];
          var _infoText = '${_shopObject['bigCategoryName']}';
          if(_shopObject['middleCategoryName'] != null) _infoText = _infoText + ' | ${_shopObject['middleCategoryName']}';
          if(_shopObject['smallCategoryName'] != null) _infoText = _infoText + ' | ${_shopObject['smallCategoryName']}';
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {navigatorPush(context: context, widget: ShopView(shopNo: _shopObject['shopId'], infoText: _infoText));},
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 113,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.341,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: Color(0xffededed), width: 1),
                          color: Color(0xffededed),
                        ),
                        child: _shopObject['shopImage'] != null ? Image.network(_shopObject['shopImage'], fit: BoxFit.fill) : Container()
                      )
                    ),
                    SizedBox(width: 12),
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_shopObject['shopName'], style: textStyle(weight: 500, size: 16.0)),
                        Text(_infoText, style: textStyle(color: Color(0xff383838), weight: 400, size: 13.0)),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('asset/image/locationPointer.png', width: 10),
                                Text('', style: textStyle(weight: 400, size: 13.0)),
                              ]
                            ),
                            Image.asset('asset/image/star3.png', height: 20),
                          ]
                        )
                      ]
                    ))
                  ]
                )
              )
            )
          );
        })
      )
    );
  }
}