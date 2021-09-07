import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'functions.dart';

showExitDialog(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => ExitDialog()
  )) ?? false;
}

class ExitDialog extends StatefulWidget {
  @override
  State<ExitDialog> createState() => _ExitDialog();
}
class _ExitDialog extends State<ExitDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: exitBox()
    );
  }

  exitBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 112,
            child: Center(
              child: Text('푸디를 종료하시겠습니까?', style: textStyle(weight: 400, size: 16.0))
            )
        ),
        IntrinsicHeight(
            child: Container(
              height: 52,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  actionBox(false),
                  actionBox(true),
                ]
              )
            )
          )
        ]
      )
    );
  }

  actionBox(bool action) {
    return Expanded(child: Container(
      child: GestureDetector(
        onTap: () {
          action ? SystemNavigator.pop() : Navigator.of(context).pop(false);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffebebeb), width: 1),
            color: Color(0xfffbfbfb),
          ),
          child: Center(
            child: Text(action ? '확인' : '취소', style: textStyle(color: Color(0xff0958c5), weight: 600, size: 14.0))
          )
        )
      ),
    ));
  }
}