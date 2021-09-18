import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/statelessAppBar.dart';

import 'findDialog.dart';
import 'loginView.dart';
import 'signUpView.dart';

class FindEmailView extends StatefulWidget {
  @override
  State<FindEmailView> createState() => _FindEmailView();
}
class _FindEmailView extends State<FindEmailView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: DefaultAppBar(title: '회원정보 찾기'),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                signUpTextField('이름', nameController),
                signUpTextField('이메일', emailController),
                loginNextButton(context: context, route: LoginView(), dialog: showFindDialog)
              ]
            )
          )
        )
      )
    );
  }
}