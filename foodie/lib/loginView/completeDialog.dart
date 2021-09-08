import 'package:flutter/material.dart';
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
      content: Container(
        width: 324, height: 228,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterLogo(size: 64),
              SizedBox(height: 12),
              Text('가입이 완료되었습니다.', style: textStyle(weight: 500, size: 16.0)),
              SizedBox(height: 16),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {Navigator.pop(context);},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    )
                  ),
                  child: Center(
                    child: Text('확인', style: textStyle(weight: 500, size: 16.0))
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