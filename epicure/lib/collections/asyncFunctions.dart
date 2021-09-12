import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodie/main.dart';

checkSubscribe() async {
  final pref = await SharedPreferences.getInstance();
  isSubscribe = pref.getBool('isSubscribe') ?? false;
}
setSubscribe() async {
  final pref = await SharedPreferences.getInstance();
  pref.setBool('isSubscribe', isSubscribe);
}

Future<bool> onWillPop(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('에피큐어 종료'),
      content: Text('에피큐어를 종료하시겠습니까?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: Text('Yes'),
        ),
      ],
    ),
  )) ?? false;
}