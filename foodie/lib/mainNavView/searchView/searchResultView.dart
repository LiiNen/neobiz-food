import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/restApi/presetRequestBody.dart';
import 'package:foodie/restApi/searchLocalApi.dart';
import 'package:foodie/restApi/searchSubwayApi.dart';
import 'package:foodie/restApi/searchTownApi.dart';
import 'package:foodie/restApi/shopApi.dart';
import 'package:foodie/serviceViews/supportView.dart';
import 'package:foodie/shopContainerView/shopListContainer.dart';
import 'package:foodie/shopView/shopView.dart';

class SearchResultView extends StatefulWidget {
  final String title;
  final String searchType;
  final dynamic requestItem;
  final int regionId;
  SearchResultView({required this.title, required this.searchType, required this.requestItem, this.regionId=-1});

  @override
  State<SearchResultView> createState() => _SearchResultView(title: title, searchType: searchType, requestItem: requestItem, regionId: regionId);
}
class _SearchResultView extends State<SearchResultView> with SingleTickerProviderStateMixin {
  String title;
  String searchType;
  dynamic requestItem;
  int regionId;
  _SearchResultView({required this.title, required this.searchType, required this.requestItem, required this.regionId});

  var _searchItemList = [];

  var _isRed = true;
  var _filterSelectedIndex = 0;
  var _filterTitleList = ['구역별', '메뉴별', '상황별'];

  late TabController controller;

  var tempList = [
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
    ['1', '2', '8', '9', '10', '11', '12', '13'],
    ['1', '2', '3', '4', '5', '6', '7',]
  ];

  var filterItemList = [];

  @override
  void initState() {
    super.initState();
    switch(searchType) {
      case 'local':
        _getLocalSearchList();
        break;
      case 'subway':
        _getSubwaySearchList();
        break;
      case 'town':
        _getTownSearchList();
        break;
    }
    controller = TabController(length: 3, vsync: this, initialIndex: 0);
    controller.addListener(_controllerListener);
    filterItemList = tempList[controller.previousIndex];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _controllerListener() {
    if(controller.indexIsChanging) setState(() {
      filterItemList = tempList[controller.index];
    });
  }

  _getLocalSearchList() async {
    print(requestItem);
    var temp = await searchLocal(doNum: requestItem['doNum'], siName: requestItem['siName'], mode: 'shop', presetBody: presetSearchRequest());
    setState(() {
      _searchItemList = temp;
    });
  }
  _getSubwaySearchList() async {
    var temp;
    if(regionId != -1) {
      temp = await getShopByRegion(id: regionId, region: 'subway');
    }
    else {
      temp = await searchSubway(subwayQueryData: requestItem, mode: 'shop', presetBody: presetSearchRequest());
    }
    setState(() {
      print(temp);
      _searchItemList = temp;
    });
  }
  _getTownSearchList() async {
    var temp;
    if(regionId != -1) {
      temp = await getShopByRegion(id: regionId, region: 'village');
    }
    else {
      temp = await searchTown(townNo: requestItem['townNo'], mode: 'shop', presetBody: presetSearchRequest());
    }
    setState(() {
      _searchItemList = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: title, elevation: false),
      backgroundColor: Color(0xfffcfcfc),
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
                      _searchItemList.length >= 4 ? recommendContainer() : Container(),
                      SizedBox(height: 28),
                      addShopButton(),
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
              child: Image.asset('asset/image/searchFilter.png', width: 22, height: 16),
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
          color: _selected ? color=='red' ? serviceColor() : Color(0xff66af6e) : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: _selected ? color=='red' ? serviceColor() : Color(0xff66af6e) : Color(0xffededed), width: 1)
        ),
        child: Center(child: Text(color == 'red' ? '레드리스트' : '그린리스트', style: _selected ?
          textStyle(color: Colors.white, weight: 700, size: 14.0) :
          textStyle(color: Color(0xff8e8e8e), weight: 500, size: 14.0)
        ))
      )
    );
  }

  //todo: hack rec column
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
    var _infoText = '${_item['bigCategoryName']}';
    if(_item['middleCategoryName'] != null) _infoText = _infoText + ' | ${_item['middleCategoryName']}';
    if(_item['smallCategoryName'] != null) _infoText = _infoText + ' | ${_item['smallCategoryName']}';

    return Expanded(child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {navigatorPush(context: context, widget: ShopView(shopNo: _item['shopId'], infoText: _infoText,));},
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
                child: _item['shopImage'] != null ? Image.network(_item['shopImage'], fit: BoxFit.fill) : Container()
              )
            ),
            SizedBox(height: 7),
            Text(_item['shopName'], style: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0)),
            SizedBox(height: 2),
            Text(_infoText, style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 13.0)),
            SizedBox(height: 5),
            _item['foodielogRating'] == '' ? Container() : Image.asset('asset/image/star${_item['foodielogRating'].length}.png', height: 20)
          ]
        )
      )
    ));
  }

  addShopButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: yellowPointBox(
        context: context,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('숨은 맛집을 직접 등록해주세요', style: textStyle(color: Color(0xffff9933), weight: 700, size: 13.0)),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                navigatorPush(context: context, widget: SupportView(supportId: 2));
              },
              child: Container(
                height: 47,
                child: Center(child: Container(
                  width: 78, height: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: const Color(0xffff9933), width: 1),
                    color: const Color(0xffffffff)
                  ),
                  child: Center(child: Text('등록하기', style: textStyle(color: Color(0xffff9933), weight: 500, size: 12.0))),
                ))
              )
            )
          ]
        )
      )
    );
  }

  showFilter() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        filterTabBar(setState),
                        lineDivider(),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 70),
                              child: Column(
                                children: [
                                  // filterTypeContainer(setState),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 18, vertical: 33),
                                    child: Column(
                                      children: filterItemRow(setState)
                                    )
                                  ),
                                  SizedBox(height: 10),
                                ]
                              )
                            )
                          )
                        ),
                      ]
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: bottomNavigationButton(title: '확인', action: () {
                        //todo: re-search action with filter results
                      })
                    )
                  ]
                )
              )
            );
          }
        );
      }
    );
  }

  filterTabBar(setState) {
    return TabBar(
      padding: EdgeInsets.only(top: 10),
      onTap: (index) {
        setState(() {});
      },
      controller: controller,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 4, color: serviceColor()),
        insets: EdgeInsets.symmetric(horizontal: 30),
      ),
      labelColor: serviceColor(), unselectedLabelColor: Color(0xff8e8e8e),
      labelStyle: textStyle(color: serviceColor(), weight: 700, size: 16.0),
      unselectedLabelStyle: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0),
      tabs: [
        Tab(text: '구역별'),
        Tab(text: '메뉴별'),
        Tab(text: '상황별'),
      ],
    );
  }

  filterItemRow(setState) {
    var filterRowList = List.generate((filterItemList.length/3).floor() * 2 - 1, (index) {
      if(index%2==1) return SizedBox(height: 10);
      var itemIndex = (index/2).floor()*3;
      print(filterItemList);
      print(itemIndex);
      return Row(
        children: [
          filterDetailBox(filterItemList[itemIndex], setState),
          SizedBox(width: 10),
          filterDetailBox(itemIndex+1 < filterItemList.length ? filterItemList[itemIndex+1] : '', setState),
          SizedBox(width: 10),
          filterDetailBox(itemIndex+2 < filterItemList.length ? filterItemList[itemIndex+2] : '', setState),
        ]
      );
    });
    return filterRowList;
  }

  filterDetailBox(String title, setState) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            setState(() {
              //todo: selected
            });
          },
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                border: Border.all(color: const Color(0xffededed), width: 1),
                color: const Color(0xffffffff)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title, style: textStyle(weight: 500, size: 15.0)),
                  Text('0', style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 13.0)),
                ]
              )
            )
          )
        )
      )
    );
  }

  filterTypeContainer(setState) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.white,
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