import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:geolocator/geolocator.dart';

class SearchPositionView extends StatefulWidget {
  @override
  State<SearchPositionView> createState() => _SearchPositionView();
}
class _SearchPositionView extends State<SearchPositionView> {
  Position? _position;

  @override
  void initState() {
    super.initState();
    _getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return _position != null ? Scaffold(
      appBar: DefaultAppBar(title: '위치'),
      body: Column(
        children: [
          Text(_position!.longitude.toString()),
          Text(_position!.latitude.toString())
        ]
      )
    ) : Scaffold(
      appBar: DefaultAppBar(title: '위치 권한 확인 중..'),
    );
  }

  _getPosition() async {
    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    ).then((Position position) async {
      setState(() {
        _position = position;
        print(_position!.longitude);
        print(_position!.latitude);
      });
    });
  }
}