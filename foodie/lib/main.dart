import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginView/loginView.dart';
import 'mainNavView/mainNavView.dart';

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

/// testing localhost api
int userId = 333;
String userName = '김정훈';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  bool? _isLogin;


  @override
  void initState() {
    super.initState();
    new Future.delayed(new Duration(seconds: 2), _checkLogin);
  }

  Future _checkLogin() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _isLogin = pref.getBool('login') ?? false;
      print(_isLogin);
    });
  }

  @override
  Widget build(BuildContext context) {
    maxWidth = MediaQuery.of(context).size.width;
    if(_isLogin != null && _isLogin!){
      return MaterialApp(
        home: MainNavView()
      );
    }
    else if (_isLogin != null && !_isLogin!) {
      return MaterialApp(
        home: LoginView()
      );
    }
    return Scaffold(
      body: Center(
        child: Image.asset('asset/image/logo.png', width: 195, height: 65)
      )
    );
  }
}