/// google map 을 이용한 페이지입니다.
/// ios 에서만 사용합니다.

import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:geolocator/geolocator.dart';

/// android exception handler
class SearchPositionKakaoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SearchPositionGoogleView extends StatefulWidget {
  @override
  State<SearchPositionGoogleView> createState() => _SearchPositionGoogleView();
}
class _SearchPositionGoogleView extends State<SearchPositionGoogleView> {
  Position? _position;

  @override
  void initState() {
    super.initState();
    _getPosition();
  }

  _getPosition() async {
    Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    ).then((Position position) async {
      setState(() {
        _position = position;
        print(_position!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _position != null ? Scaffold(
      appBar: DefaultAppBar(title: '위치'),
      body: Column(
        children: [
          kakaoMap()
        ]
      )
    ) : Scaffold(
      appBar: DefaultAppBar(title: '위치 권한 확인 중..'),
    );
  }

  kakaoMap() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Container()
    );
  }
}