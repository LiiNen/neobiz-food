import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/exitDialog.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/mainNavView/mainNavView.dart';
import 'package:foodie/restApi/userApi.dart';

import 'signUpView.dart';
import 'findEmailView.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginView();
}
class _LoginView extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool isAutoLogin = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitDialog(context),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.135),
                      Image.asset('asset/image/logo.png', width: 186, height: 62),
                      SizedBox(height: 58),
                      loginTextField('email', emailController),
                      SizedBox(height: 22),
                      loginTextField('pw', pwController),
                      SizedBox(height: 26),
                      loginRowMenu(),
                      SizedBox(height: 26),
                      loginButton(action: _loginAction),
                      SizedBox(height: 19),
                      socialLoginContainer()
                    ]
                  )
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('아직 회원이 아니신가요?', style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 13.0)),
                        SizedBox(width: 5),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {navigatorPush(context: context, widget: SignUpView());},
                          child: Text('회원가입 하기', style: textStyle(color: serviceColor(), weight: 400, size: 13.0)),
                        ),
                      ],
                    ),
                    SizedBox(height: 11),
                    Image.asset('asset/image/loginBottomLogo.png', width: MediaQuery.of(context).size.width),
                    SizedBox(height: 20)
                  ]
                )
              ],
            )
          )
        )
      )
    );
  }

  _loginAction() async {
    // todo: login with account
    // check: login state
    // var _response = await checkEmail('kjeonghoon065@gmail.ccc');
    // var _response2 = await checkPhone('010-9394-1087');
    var _response = await getUser(id: 34);
    if(_response != null) {
      navigatorPush(context: context, widget: MainNavView(), replacement: true, all: true);
    }
    else {
      showToast('error');
    }
  }

  loginTextField(String type, TextEditingController loginController) {
    String hintText = (type == 'email' ? 'E-mail' : 'Password');
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 22,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   margin: EdgeInsets.only(left: 10),
                //   width: 20,
                //   height: 20,
                //   child: Center(child: Image.asset(type=='email' ? 'asset/image/loginEmail.png' : 'asset/image/loginPassword.png', fit: BoxFit.fill,))
                // ),
                Expanded(
                  child: TextField(
                    controller: loginController,
                    obscureText: (type == 'pw' ? true : false),
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 15.0),
                    ),
                    style: textStyle(color: Colors.black, weight: 400, size: 15.0),
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

  loginButton({required action, double height=45}){
    return GestureDetector(
      onTap: () { action(); },
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(3),
          ),
          color: serviceColor(),
        ),
        child: Center(child: Text('로그인', style: textStyle(color: Colors.white, weight: 700, size: 15.0)))
      )
    );
  }

  loginRowMenu() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          autoLoginButton(),
          findLoginButton()
        ]
      )
    );
  }
  autoLoginButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          isAutoLogin = !isAutoLogin;
        });
      },
      child: Container(
        height: 20,
        child: Row(
          children: [
            Container(
              width: 19, height: 19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                border: Border.all(color: Color(0xffe0e0e0), width: 1),
                color: Color(0xffffffff)
              ),
              child: isAutoLogin ? Center(
                child: Icon(Icons.check, color: serviceColor(), size: 19)
              ) : Container()
            ),
            SizedBox(width: 8),
            Text('자동 로그인', style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 14.0))
          ]
        )
      )
    );
  }
  findLoginButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        navigatorPush(context: context, widget: FindEmailView());
      },
      child: Container(
        height: 20,
        child: Text('아이디 / 비밀번호 찾기', style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 14.0))
      )
    );
  }

  socialLoginContainer() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('간편로그인', style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 14.0)),
          SizedBox(height: 7),
          lineDivider(),
          SizedBox(height: 23),
          socialLoginRow(),
        ]
      )
    );
  }
  var socialLoginList = ['Google', 'Naver', 'Kakao', 'Facebook'];
  socialLoginRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(socialLoginList.length * 2 - 1, (index) {
        if(index % 2 == 1) return SizedBox(width: 16);
        return socialLoginButton((index/2).floor());
      })
    );
  }
  socialLoginButton(int index) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          /// todo : action by index
        },
        child: Image.asset('asset/image/login${socialLoginList[index]}.png', fit: BoxFit.fill)
      )
    );
  }

}