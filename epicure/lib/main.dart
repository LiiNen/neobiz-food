import 'package:flutter/material.dart';
import 'package:foodie/functions.dart';
import 'package:foodie/statelessWidgets.dart';

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

  @override
  Widget build(BuildContext context) {
    maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
        children: [
          confirmButton(title: 'signIn', confirmAction: pushSignIn),
          confirmButton(title: 'signUp', confirmAction: pushSignUp),
        ]
      )
    );
  }

  void pushSignIn() {navigatorPush(context: context, route: SignInView());}
  void pushSignUp() {navigatorPush(context: context, route: SignUpView());}
}