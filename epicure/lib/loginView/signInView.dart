import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/restApi/signInApi.dart';
import 'package:foodie/collections/statelessWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../homeView.dart';

class SignInView extends StatefulWidget {
  @override
  State<SignInView> createState() => _SignInView();
}
class _SignInView extends State<SignInView> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  bool _loginChecked = false;

  @override
  void initState() {
    super.initState();
    loginCheck();
  }

  void loginCheck() async {
    final pref = await SharedPreferences.getInstance();
    List<String> _loginInfo = pref.getStringList('loginInfo') ?? [];
    if(_loginInfo.length != 0) {
      _loginRoute(await login(id: _loginInfo[0], pw: _loginInfo[1]));
      showToast('auto login!');
    }
    setState(() {
      _loginChecked = true;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: !_loginChecked ? Center(child: CircularProgressIndicator()) : Container(
        margin: EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: idController,
            ),
            TextField(
              controller: pwController,
            ),
            confirmButton(title: '로그인', confirmAction: _loginButtonAction),
          ],
        )
      )
    );
  }

  void _loginButtonAction() async {
    LoginStatus loginStatus = await login(id: idController.text, pw: pwController.text);
    _loginRoute(loginStatus);
  }
  void _loginRoute(LoginStatus loginStatus) async {
    if(loginStatus.done) {
      final pref = await SharedPreferences.getInstance();
      bool _isInstalled = pref.getBool('isInstalled') ?? false;
      showToast('login success');
      print(_isInstalled);
      if(!_isInstalled) {
        setIsInstalled();
        // login 2
        welcomeRoute();
      }
      else {
        // login 3
        homeRoute();
      }
    }
    else {
      showToast('login failed');
    }
  }

  void homeRoute() { navigatorPush(context: context, route: HomeView()); }
  void welcomeRoute() { navigatorPush(context: context, route: WelcomeView()); }
}