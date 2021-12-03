import 'package:flutter/material.dart';
import 'package:foodie/collections/exitDialog.dart';
import 'package:foodie/collections/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'loginView/loginView.dart';
import 'mainNavView/mainNavView.dart';

void main() async{
  runApp(MyApp());
  await dotenv.load(fileName: '.env');
  print(dotenv.env['he']);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashView()
    );
  }
}

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashView();
}

class _SplashView extends State<SplashView> {
  bool? _isLogin;

  @override
  void initState() {
    super.initState();
    new Future.delayed(new Duration(seconds: 1), _checkLogin);
  }

  _checkLogin() async {
    _isLogin = false;

    if(_isLogin == true) {
      navigatorPushWithoutAnimation(context: context, widget: MainNavView());
    }
    else {
      navigatorPushWithoutAnimation(context: context, widget: LoginView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitDialog(context),
      child: Scaffold(
        backgroundColor: Color(0xffff7c2f),
        body: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
          child: Column(
            children: [
              Image.asset('asset/image/logoSplash.png', width: 195),
            ]
          )
        )
      )
    );
  }
}

double maxWidth = 0;

/// testing localhost api
int userId = 333;
String userName = '김정훈';