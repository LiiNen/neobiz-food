import 'package:flutter/material.dart';
import 'package:foodie/functions.dart';
import 'package:foodie/restApi/signInApi.dart';
import 'package:foodie/statelessWidgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInView extends StatefulWidget {
  @override
  State<SignInView> createState() => _SignInView();
}
class _SignInView extends State<SignInView> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
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
            GestureDetector(
              onTap: () {_loginAction();},
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.blue,
                ),
                child: Text('로그인'),
              )
            )
          ],
        )
      )
    );
  }

  void _loginAction() async {
    LoginStatus loginStatus = await login(id: idController.text, pw: pwController.text);
    if(loginStatus.done) {
      final pref = await SharedPreferences.getInstance();
      bool _isInstalled = pref.getBool('isInstalled') ?? false;
      showToast('login success');
      if(!_isInstalled) {
        setIsInstalled();
        // login 2
      }
      else {
        // login 3
      }
    }
    else {
      showToast('login failed');
    }
  }
}