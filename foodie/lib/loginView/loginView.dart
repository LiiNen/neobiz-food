import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/exitDialog.dart';
import 'package:foodie/collections/functions.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginView();
}
class _LoginView extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitDialog(context),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SizedBox(height: 137),
                  FlutterLogo(size: 50),
                  SizedBox(height: 90),
                  loginTextField('email', emailController),
                  loginTextField('pw', pwController),
                  SizedBox(height: 38),
                  loginButton(title: '로그인', action: () => {},),
                  SizedBox(height: 96),
                  loginButton(title: '간편 로그인', action: () => {},),
                ],
              )
            )
          )
        )
      )
    );
  }

  loginTextField(String type, TextEditingController loginController) {
    String hintText = (type == 'email' ? '이메일을 입력해주세요.' : '비밀번호를 입력해주세요.');
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Row(
              children: [
                FlutterLogo(size: 28),
                Expanded(
                  child: TextField(
                    controller: loginController,
                    obscureText: (type == 'pw' ? true : false),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 15.0),
                    )
                  )
                )
              ],
            )
          ),
          lineDivider()
        ]
      )
    );
  }

  loginButton({required title, required action}){
    bool isSimple = (title == '간편 로그인');
    return GestureDetector(
      onTap: () {action();},
      child: Container(
        height: 58,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSimple ? Color(0xffe0e0e0) : Color(0xffededed)
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          color: isSimple ? Colors.white : Color(0xffededed),
        ),
        child: Center(child: Text(title, style: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0)))
      )
    );
  }
}