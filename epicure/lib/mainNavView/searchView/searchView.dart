import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessWidgets.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchView();
}
class _SearchView extends State<SearchView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(detailTitle: '탐색',),
    );
  }
}