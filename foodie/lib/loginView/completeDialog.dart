import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';

showCompleteDialog(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => CompleteDialog()
  )) ?? false;
}

class CompleteDialog extends StatelessWidget {
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: Container(
        width: 324, height: 228,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8)
          ),
          color: Color(0xffffffff)
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('asset/image/loginAccept.png', width: 62, height: 62),
              SizedBox(height: 15),
              Text('가입이 완료되었습니다.', style: textStyle(weight: 500, size: 16.0)),
              SizedBox(height: 22),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {Navigator.pop(context);},
                child: Container(
                  width: 154, height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    color: serviceColor()
                  ),
                  child: Center(
                    child: Text('확인', style: textStyle(color: Colors.white, weight: 700, size: 15.0))
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}