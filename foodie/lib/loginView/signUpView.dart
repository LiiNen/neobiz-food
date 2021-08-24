import 'package:flutter/material.dart';

import 'package:foodie/statelessWidgets.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpView();
}
class _SignUpView extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Center(child: Text('signup'))
      )
    );
  }
}