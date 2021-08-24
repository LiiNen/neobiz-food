import 'package:flutter/material.dart';
import 'package:foodie/restApi.dart' as api;
import 'package:foodie/statelessWidgets.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginView();
}
class _LoginView extends State<LoginView> {
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
    var responseBody = await api.login(idController.text, pwController.text);
    print('response body');
    print(responseBody);
  }
}