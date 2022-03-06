import 'package:flutter/cupertino.dart';

/// kakao map 을 이용한 페이지입니다.
/// android 에서만 사용합니다.

// import 'package:flutter/material.dart';
// import 'package:flutter_kakao_map/flutter_kakao_map.dart';
// import 'package:flutter_kakao_map/kakao_maps_flutter_platform_interface.dart';
// import 'package:foodie/collections/statelessAppBar.dart';
// import 'package:geolocator/geolocator.dart';
//
// /// ios exception handler
// class SearchPositionGoogleView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
// class SearchPositionKaKaoView extends StatefulWidget {
//   @override
//   State<SearchPositionKaKaoView> createState() => _SearchPositionKaKaoView();
// }
// class _SearchPositionKaKaoView extends State<SearchPositionKaKaoView> {
//   late KakaoMapController mapController;
//   late MapPoint _mapPosition;
//   late CameraPosition _cameraPosition;
//   Position? _position;
//
//   @override
//   void initState() {
//     super.initState();
//     _getPosition();
//   }
//
//   _getPosition() async {
//     Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high
//     ).then((Position position) async {
//       setState(() {
//         _position = position;
//         _mapPosition = MapPoint(_position!.latitude, _position!.longitude);
//         _cameraPosition = CameraPosition(target: MapPoint(_position!.latitude, _position!.longitude), zoom: 5);
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _position != null ? Column(
//         children: [
//           kakaoMap()
//         ]
//       ) : Container();
//   }
//
//   kakaoMap() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 300,
//       child: KakaoMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: _cameraPosition,
//       )
//     );
//   }
//
//   void _onMapCreated(KakaoMapController controller) async {
//     final MapPoint _newPosition = await controller.getMapCenterPoint();
//     setState(() {
//       mapController = controller;
//       _mapPosition = _newPosition;
//     });
//   }
//
// }