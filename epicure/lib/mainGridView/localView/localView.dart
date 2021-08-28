import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/mainGridView/localView/localRegionView.dart';
import 'package:foodie/restApi/searchLocalApi.dart';
import 'package:foodie/collections/functions.dart';

class LocalItem {
  String title;
  String fullTitle;
  List<String>? childTitleList;
  LocalItem({required this.title, required this.fullTitle, this.childTitleList});
}

List<String> localTitleList = [
  '서울', '경기', '인천', '부산',
  '대구', '대전', '광주', '울산',
  '강원', '충북', '충남', '경북',
  '경남', '전북', '전남', '제주'];
List<String> localFullTitleList = [
  '서울특별시', '경기도', '인천광역시', '부산광역시',
  '대구광역시', '대전광역시', '광주광역시', '울산광역시',
  '강원도', '충청북도', '충청남도', '경상북도',
  '경상남도', '전라북도', '전라남도', '제주도'];

List<LocalItem> localItemList = List.generate(localTitleList.length, (index) {
  return LocalItem(title: localTitleList[index], fullTitle: localFullTitleList[index]);
});


class LocalView extends StatefulWidget {
  @override
  State<LocalView> createState() => _LocalView();
}
class _LocalView extends State<LocalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MainTitleBar(title: '대한민국'),
            localItemBuilder()
          ],
        )
      )
    );
  }

  localItemBuilder() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: GridView.count(
        crossAxisCount: 4,
        children: List.generate(localItemList.length, (index) {
          return Container(
            child: Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      print(localItemList[index].title);
                      navigatorPush(context: context, route: LocalRegionView(title: localItemList[index].title, titleIndex: index));
                    }
                  )
                ),
                Center(
                  child: Text(localItemList[index].title)
                )
              ]
            )
          );
        })
      )
    );
  }
}