import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/restApi/searchLocalApi.dart';


List<Map<String, dynamic>> localRegionItemList = [];

class LocalRegionView extends StatefulWidget {
  final String title;
  final int titleIndex;
  LocalRegionView({required this.title, required this.titleIndex});

  @override
  State<LocalRegionView> createState() => _LocalRegionView(title: title, titleIndex: titleIndex);
}
class _LocalRegionView extends State<LocalRegionView> {
  String title;
  int titleIndex;
  _LocalRegionView({required this.title, required this.titleIndex});

  @override
  void initState() {
    super.initState();
    getRegion();
  }

  // TODO: json map parsing to flutter
  getRegion() async {
    localRegionItemList = await searchLocal(doNum: titleIndex, siName: '', mode: 'region');

    print(localRegionItemList[0]);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainTitleBar(title: title),

          ],
        )
      )
    );
  }
}