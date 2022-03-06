import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainNavView/searchPositionView/searchPositionAppBar.dart';
import 'package:foodie/mainNavView/searchPositionView/searchPositionTabView.dart';

class SearchPositionView extends StatefulWidget {
  @override
  State<SearchPositionView> createState() => _SearchPositionView();
}
class _SearchPositionView extends State<SearchPositionView> with SingleTickerProviderStateMixin {

  late TabController filterController;

  var _filterSelectedIndex = 0;
  var _filterTitleList = ['구역별', '메뉴별', '상황별'];

  var tempList = [
    ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
    ['1', '2', '8', '9', '10', '11', '12', '13'],
    ['1', '2', '3', '4', '5', '6', '7',]
  ];
  var filterItemList = [];

  bool isRed = true;

  @override
  void initState() {
    super.initState();

    filterController = TabController(length: 3, vsync: this, initialIndex: 0);
    filterController.addListener(_controllerListener);
    filterItemList = tempList[filterController.previousIndex];
  }

  @override
  void dispose() {
    filterController.dispose();
    super.dispose();
  }

  _controllerListener() {
    if(filterController.indexIsChanging) setState(() {});
  }

  colorChangeListener(String color) {
    setState(() {
      if(color == 'red') isRed = true;
      else if(color == 'green') isRed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo get region
      appBar: SearchPositionAppBar(title: '위치', back: false, callback: showFilter),
      body: SearchPositionTabView(colorChangeListener: colorChangeListener, isRed: isRed)
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
      controller: filterController,
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