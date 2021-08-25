import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/loginView/findAccountView.dart';

import 'loginView/signInView.dart';
import 'loginView/signUpView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage()
    );
  }
}

double maxWidth = 0;

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('App terminate'),
        content: Text('Do you want to exit epicure?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;

  }

  @override
  Widget build(BuildContext context) {
    maxWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: MainAppBar(),
        body: Column(
          children: [
            confirmButton(title: 'signIn', confirmAction: pushSignIn),
            confirmButton(title: 'signUp', confirmAction: pushSignUp),
            confirmButton(title: 'findAccount', confirmAction: pushFindAccount),
          ]
        )
      )
    );
  }

  void pushSignIn() {navigatorPush(context: context, route: SignInView());}
  void pushSignUp() {navigatorPush(context: context, route: SignUpView());}
  void pushFindAccount() {navigatorPush(context: context, route: FindAccountView());}
}