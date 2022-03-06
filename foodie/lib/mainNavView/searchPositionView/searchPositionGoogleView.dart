/// google map 을 이용한 페이지입니다.
/// ios 에서만 사용합니다.

import 'package:flutter/material.dart';
import 'package:foodie/mainNavView/searchPositionView/searchPositionBottomContainer.dart';
import 'package:foodie/mainNavView/searchPositionView/searchPositionViewTabBar.dart';
import 'package:geolocator/geolocator.dart';

/// android exception handler
class SearchPositionKakaoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SearchPositionGoogleView extends StatefulWidget {
  final dynamic colorChangeListener;
  final bool isRed;
  SearchPositionGoogleView({required dynamic this.colorChangeListener, required bool this.isRed});
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
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //todo: implement with map api
    // return _position != null ? Column(
    //     children: [
    //       googleMap(),
    //       SearchPositionBottomContainer(colorChangeListener: widget.colorChangeListener, isRed: widget.isRed)
    //     ]
    //   ) : Container();
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SearchPositionBottomContainer(colorChangeListener: widget.colorChangeListener, isRed: widget.isRed)
          )
        ]
      )
    );
  }

  googleMap() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Container()
    );
  }
}