import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';

import 'detailView.dart';

class SearchListBuilder extends StatefulWidget {
  final List searchList;
  SearchListBuilder({required this.searchList});
  @override
  State<SearchListBuilder> createState() => _SearchListBuilder(searchList: searchList);
}
class _SearchListBuilder extends State<SearchListBuilder> {
  List searchList;
  _SearchListBuilder({required this.searchList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: searchList.length,
        itemBuilder: (BuildContext context, int index) {
          return searchObject(searchList[index]);
        },
      )
    );
  }

  searchObject(item) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          navigatorPush(context: context, route: DetailView(no: item['no']));
          print(item['name']);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (
                  item['photo'] is String ?
                  Image.network(
                    item['photo'], width: 40, height: 40,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return FlutterLogo(size: 40);
                    }
                  ) : FlutterLogo(size: 40)
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item['name']),
                    Text('${item['kind']} | ${item['food_2nd']}'),
                  ]
                )
              ]
            ),
            Icon(Icons.arrow_forward_outlined, size: 40)
          ]
        )
      )
    );
  }
}