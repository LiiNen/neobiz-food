import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/loginView/subscribeInitView.dart';
import 'package:foodie/loginView/userTypeDialog.dart';

class SignUpView extends StatefulWidget{
  @override
  State<SignUpView> createState() => _SignUpView();
}
class _SignUpView extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwConfirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String _userType = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => checkUserType());
  }
  checkUserType() async {
    _userType = await showUserTypeDialog(context);
    print(_userType);
    if(_userType == '') Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: DefaultAppBar(title: '회원가입'),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loginStep(step: 1, title: '회원정보 입력'),
                SizedBox(height: 30),
                signUpTextField('이름', nameController),
                signUpTextField('이메일', emailController),
                signUpTextField('비밀번호', pwController),
                signUpTextField('비밀번호 확인', pwConfirmController),
                signUpTextField('휴대전화', phoneController),
                signUpTextField('주소', addressController),
                SizedBox(height: 12),
              ]
            )
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(0.0),
          child: loginNextButton(context: context, route: SubscribeInitView(), condition: checkSignUp()),
        ),
      )
    );
  }

  bool checkSignUp() {
    return true;
  }
}

signUpTextField(String hintText, TextEditingController signUpController) {
  return Container(
    margin: EdgeInsets.only(bottom: 28),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          child: TextField(
            controller: signUpController,
            obscureText: (hintText == '비밀번호' || hintText == '비밀번호 확인' ? true : false),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 15.0),
            )
          )
        ),
        // SizedBox(height: 8),
        lineDivider()
      ]
    )
  );
}

loginStep({required int step, required String title}) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: Text('STEP $step\n$title', style: textStyle(weight: 500, size: 19.0))
  );
}

loginNextButton({String title='다음', required BuildContext context, required Widget route, dynamic dialog, bool condition=true, bool isReplace=false}) {
  return GestureDetector(
    onTap: () {
      if(dialog != null) dialog(context).then(
        ((_) {navigatorPush(context: context, widget: route, replacement: isReplace);})
      );
      else if(condition) navigatorPush(context: context, widget: route, replacement: isReplace);
    },
    behavior: HitTestBehavior.translucent,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
        color: serviceColor()
      ),
      child: Center(
        child: Text(title, style: textStyle(color: Colors.white, weight: 700, size: 16.0),)
      )
    )
  );
}