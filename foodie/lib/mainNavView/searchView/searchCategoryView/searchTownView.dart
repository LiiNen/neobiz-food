import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessAppBar.dart';

class SearchTownView extends StatefulWidget {
  @override
  State<SearchTownView> createState() => _SearchTownView();
}
class _SearchTownView extends State<SearchTownView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '맛집촌'),
    );
  }
}