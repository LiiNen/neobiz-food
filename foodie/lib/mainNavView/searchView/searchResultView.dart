import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/mainNavView/homeView/homeBannerContainer.dart';
import 'package:foodie/restApi/presetRequestBody.dart';
import 'package:foodie/restApi/searchLocalApi.dart';
import 'package:foodie/restApi/searchTownApi.dart';
import 'package:foodie/shopContainerView/shopListContainer.dart';
import 'package:foodie/shopView/shopView.dart';

class SearchResultView extends StatefulWidget {
  final String title;
  final String searchType;
  final dynamic requestItem;
  SearchResultView({required this.title, required this.searchType, required this.requestItem});

  @override
  State<SearchResultView> createState() => _SearchResultView(title: title, searchType: searchType, requestItem: requestItem);
}
class _SearchResultView extends State<SearchResultView> {
  String title;
  String searchType;
  dynamic requestItem;
  _SearchResultView({required this.title, required this.searchType, required this.requestItem});

  var _searchItemList = [];

  var _isRed = true;
  var _filterSelectedIndex = 0;
  var _filterTitleList = ['구역별', '메뉴별', '상황별'];

  @override
  void initState() {
    super.initState();
    switch(searchType) {
      case 'local':
        _getLocalSearchList();
        break;
      case 'subway':
        break;
      case 'town':
        _getTownSearchList();
        break;
    }
  }

  _getLocalSearchList() async {
    var temp = await searchLocal(doNum: requestItem['doNum'], siName: requestItem['siName'], mode: 'shop', presetBody: presetSearchRequest());
    setState(() {
      _searchItemList = temp;
    });
  }
  _getTownSearchList() async {
    var temp = await searchTown(townNo: requestItem['townNo'], mode: 'shop', presetBody: presetSearchRequest());
    setState(() {
      _searchItemList = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(title: title, elevation: false),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            resultTabBar(),
            lineDivider(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Color(0xfffcfcfc),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _searchItemList.length != 0 ? [
                      recommendContainer(),
                      SizedBox(height: 28),
                      titleBox('리스트'),
                      SizedBox(height: 5),
                      ShopListContainer(shopObjectList: _searchItemList)
                    ] : [
                      // 맛집정보를 불러오는 중?
                    ]
                  )
                )
              )
            )
          ]
        )
      )
    );
  }

  titleBox(String title) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Text(title, style: textStyle(weight: 700, size: 18.0))
    );
  }

  resultTabBar() {
    return Container(
      height: 78,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              tabBarColor('red'),
              SizedBox(width: 8),
              tabBarColor('green'),
            ]
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {showFilter();},
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(child: Text('필터', style: textStyle(weight: 500, size: 15.0)))
            )
          )
        ],
      )
    );
  }

  tabBarColor(String color) {
    bool _selected = (color == 'red' && _isRed) || (color == 'green' && !_isRed);
    return GestureDetector(
      onTap: () {
        setState(() {
          if(color == 'red') _isRed = true;
          else if(color == 'green') _isRed = false;
        });
      },
      child: Container(
        width: 96, height: 32,
        decoration: BoxDecoration(
          color: _selected ? serviceColor() : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: _selected ? serviceColor() : Color(0xffededed), width: 1)
        ),
        child: Center(child: Text(color == 'red' ? '레드리스트' : '그린리스트', style: _selected ?
          textStyle(color: Colors.white, weight: 700, size: 14.0) :
          textStyle(color: Color(0xff8e8e8e), weight: 500, size: 14.0)
        ))
      )
    );
  }

  recommendContainer() {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 22, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('추천맛집', style: textStyle(weight: 700, size: 18.0)),
            recommendColumn(2)
          ]
        )
      )
    );
  }
  recommendColumn(int maxLine) {
    List<Widget> _rowList = List<Widget>.generate(maxLine, (index) {
      return recommendRow(index * 2);
    });
    return Column(
      children: _rowList
    );
  }
  recommendRow(int startIndex) {
    return Row(
      children: [
        recommendBox(startIndex),
        SizedBox(width: 16),
        recommendBox(startIndex+1)
      ]
    );
  }
  recommendBox(int index) {
    var _item = _searchItemList[index];
    String _infoText = '${_item['kind']}';
    if(_item['food'] != null) _infoText = _infoText + ' | ${_item['food']}';
    if(_item['food_2nd'] != null) _infoText = _infoText + ' | ${_item['food_2nd']}';

    return Expanded(child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {navigatorPush(context: context, widget: ShopView(shopNo: _item['no'], infoText: _infoText,));},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.375,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: Color(0xffededed), width: 1),
                  color: Color(0xffededed),
                ),
                child: _item['photo'] != null ? Image.network(_item['photo'], fit: BoxFit.fill) : Container()
              )
            ),
            SizedBox(height: 7),
            Text(_item['name'], style: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0)),
            SizedBox(height: 2),
            Text(_infoText, style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 13.0)),
            // button?
          ]
        )
      )
    ));
  }

  showFilter() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 12),
                    Text('필터'),
                    SizedBox(height: 12),
                    lineDivider(),
                    SizedBox(height: 14),
                    filterTypeContainer(setState),
                    SizedBox(height: 4),
                  ]
                )
              )
            );
          }
        );
      }
    );
  }

  filterTypeContainer(setState) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 41,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Color(0xffededed),
      ),
      child: Row(
        children: _filterTitleList.map((e) {
          var index = _filterTitleList.indexOf(e);
          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  _filterSelectedIndex = index;
                });
              },
              child: index == _filterSelectedIndex ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Color(0xff8e8e8e)
                ),
                child: Center(
                  child: Text(_filterTitleList[index], style: textStyle(color: Colors.white, weight: 500, size: 15.0))
                )
              ) : Container(
                child: Center(
                  child: Text(_filterTitleList[index], style: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 15.0))
                )
              )
            )
          );
        }).toList()
      )
    );
  }
}