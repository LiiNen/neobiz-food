import 'package:flutter/material.dart';

import 'functions.dart';
import '../main.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget{
  MainAppBar({this.detailTitle}) : preferredSize = Size.fromHeight(40.0);
  @override
  final Size preferredSize;
  final String? detailTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Container(
        child: Text(detailTitle != null ? detailTitle! : 'epicure', style: TextStyle(color: Colors.black),)
      ),
    );
  }
}
class MainTitleBar extends StatelessWidget {
  final String title;
  MainTitleBar({this.title=''});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(title)
    );
  }
}

confirmButton({required title, required confirmAction}){
  return GestureDetector(
    onTap: () {confirmAction();},
    child: Container(
      height: 52,
      width: maxWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.white,
      ),
      child: Center(child: Text(title, style: textStyle(color: Colors.black, weight: 600, size: 16.0)))
    )
  );
}

defaultInputDecoration({required hintText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    enabledBorder: null,
    focusedBorder: null,
    hintText: hintText,
    hintStyle: textStyle(color: Colors.grey, weight: 400, size: 12.0)
  );
}
