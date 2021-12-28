import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchView();
}
class _SearchView extends State<SearchView> {
  List<String>? currentSearchList;
  List<String>? popularSearchList;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCurrentSearch();
    _loadPopularSearch();
  }

  _loadCurrentSearch() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      currentSearchList = pref.getStringList('currentSearchList') ?? [];
      print(currentSearchList);
    });
  }

  _loadPopularSearch() async {
    setState(() {
      popularSearchList = ['음식점1', '음식점2', '음식점3', '음식점4', '음식점5',
        '음식점6', '음식점7', '음식점8', '음식점9', '음식점입니다입니다입니다'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: SearchTextAppBar(controller: controller, callback: searchAction),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                recentSearchContainer(),
                SizedBox(height: 9),
                popularSearchContainer(),
              ],
            )
          )
        )
      )
    );
  }

  searchAction(String input) {
    //todo search with text api
    print(input);
  }

  recentSearchContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            subTitleContainer(title: '최근 검색어', topMargin: 0.0),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => {setState(() {removeCurrent(all: true);})},
              child: Text('전체삭제', style: textStyle(color: Color(0xff8a8a8a), weight: 400, size: 14.0))
            ),
          ]
        ),
        SizedBox(height: 14),
      ] + (
        currentSearchList == null ?
          [CircularProgressIndicator(strokeWidth: 10,)] :
          (currentSearchList!.length == 0 ?
            [Text('최근 검색 결과가 없습니다.')] :
            [currentSearchItemRow(0), currentSearchItemRow(1)]
          )
      ) + [SizedBox(height: 24)]
    );
  }

  removeCurrent({String target='', bool all=false}) async {
    final pref = await SharedPreferences.getInstance();
    if(all) {
      currentSearchList = [];
      pref.setStringList('currentSearchList', []);
    }
    else {
      currentSearchList!.remove(target);
      pref.setStringList('currentSearchList', currentSearchList!);
    }
  }

  currentSearchItemRow(int index) {
    index = index * 3;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(child: currentSearchItem(index)),
          SizedBox(width: 10),
          Expanded(child: currentSearchItem(index+1)),
          SizedBox(width: 10),
          Expanded(child: currentSearchItem(index+2))
        ]
      )
    );
  }
  currentSearchItem(int index) {
    bool _accept = true;
    String title = '';
    if(currentSearchList!.length > index) {
      title = currentSearchList![index];
    } else {
      _accept = false;
    }

    return _accept ? GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => {
        // todo: search with title
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.black, width: 1),
          color: Colors.white,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(title,
                style: textStyle(weight: 500, size: 14.0),
                overflow: TextOverflow.ellipsis,
              )),
              GestureDetector(
                onTap: () => {setState(() {removeCurrent(target: title);})},
                behavior: HitTestBehavior.translucent,
                child: FlutterLogo(size: 10), // x icon
              )
            ]
          )
        )
      )
    ) : Container();
  }

  popularSearchContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          subTitleContainer(title: '인기 검색어'),
          SizedBox(height: 14),
        ] + (
          popularSearchList == null ?
            [CircularProgressIndicator(strokeWidth: 10,)] :
            [
              popularSearchItemRow(0),
              popularSearchItemRow(1),
              popularSearchItemRow(2),
              popularSearchItemRow(3),
              popularSearchItemRow(4),
            ]
        )
      )
    );
  }

  popularSearchItemRow(int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 11),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 18),
            width: 20,
            alignment: Alignment.center,
            child: Text((index + 1).toString(), style: textStyle(weight: 500, size: 15.0),)
          ),
          Expanded(child: popularSearchItem(index)),
          SizedBox(width: 18),
          Container(
              margin: EdgeInsets.only(right: 18),
              width: 20, alignment: Alignment.center,
              child: Text((index + 6).toString(), style: textStyle(weight: 500, size: 15.0),)
          ),
          Expanded(child: popularSearchItem(index+5))
        ]
      )
    );
  }

  popularSearchItem(int index) {
    return GestureDetector(
      onTap: () => {
        // search with title
        print(index)
      },
      behavior: HitTestBehavior.translucent,
      child: Container(child: Text(popularSearchList![index],
        style: textStyle(weight: 500, size: 15.0),
        overflow: TextOverflow.ellipsis,
      )),
    );
  }
}