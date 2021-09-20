import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/restApi/presetRequestBody.dart';
import 'package:foodie/restApi/searchLocalApi.dart';

class SearchResultView extends StatefulWidget {
  final String title;
  final String searchType;
  dynamic requestItem;
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
        break;
    }
  }

  _getLocalSearchList() async {
    var temp = await searchLocal(doNum: requestItem['doNum'], siName: requestItem['siName'], mode: 'shop', presetBody: presetSearchRequest());
    setState(() {
      _searchItemList = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: title),
    );
  }
}