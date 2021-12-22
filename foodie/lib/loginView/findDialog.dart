import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';

showFindDialog(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => FindDialog()
  )) ?? false;
}

class FindDialog extends StatefulWidget {
  @override
  State<FindDialog> createState() => _FindDialog();
}
class _FindDialog extends State<FindDialog>{
  String content = '';

  @override
  void initState() {
    super.initState();

    //circular test
    new Future.delayed(new Duration(seconds: 2), _findAccount);
    // _findAccount();
  }

  _findAccount() async {
    setState(() {content = '123';});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: Container(
        width: 324, height: 294,
        child: Center(
          child: content == '' ? CircularProgressIndicator(strokeWidth: 10,) : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('asset/image/loginAccept.png', width: 65, height: 65),
              SizedBox(height: 12),
              Text(content),
              SizedBox(height: 24),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {Navigator.pop(context);},
                child: Container(
                  width: 154, height: 49,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    color: serviceColor()
                  ),
                  child: Center(
                      child: Text('비밀번호 초기화 메일이 전송되었습니다.', style: textStyle(color: Colors.white, weight: 700, size: 16.0))
                  )
                )
              )
            ],
          )
        )
      )
    );
  }
}