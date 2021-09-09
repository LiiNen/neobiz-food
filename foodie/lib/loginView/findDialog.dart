import 'package:flutter/material.dart';

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
      content: Container(
        width: 324, height: 294,
        child: Center(
          child: content == '' ? CircularProgressIndicator(strokeWidth: 10,) : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterLogo(size: 64),
              SizedBox(height: 12),
              Text(content)
            ],
          )
        )
      )
    );
  }
}