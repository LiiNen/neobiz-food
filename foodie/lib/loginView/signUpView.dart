import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/loginView/subscribeInitView.dart';
import 'package:foodie/loginView/userTypeDialog.dart';
import 'package:foodie/serviceViews/addressSelectionView.dart';
import 'package:kpostal/kpostal.dart';

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
  TextEditingController detailAddressController = TextEditingController();

  String _userType = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => checkUserType());
  }
  checkUserType() async {
    _userType = await showUserTypeDialog(context);
    setState(() {});
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
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loginStep(step: 1, title: '회원정보 입력'),
                SizedBox(height: 30),
                fullWidthTextField(_userType == 'shop' ? '매장명' : '이름', nameController),
                fullWidthTextField('이메일', emailController),
                fullWidthTextField('비밀번호', pwController),
                fullWidthTextField('비밀번호 확인', pwConfirmController),
                fullWidthTextField('휴대전화', phoneController, isNumber: true),
                fullWidthTextField('우편번호', addressController, rightButton: findAddressButton(), enabled: false),
                fullWidthTextField('상세주소', detailAddressController),
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

  findAddressButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        await Navigator.push(context, MaterialPageRoute(
          builder: (_) => addressSelectionView(addressReturnCallback),
        ));
      },
      child: Container(
        width: 73, height: 34,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color(0xfffff0e3),
          borderRadius: BorderRadius.all(Radius.circular(24))
        ),
        child: Center(
          child: Text('주소찾기', style: textStyle(color: serviceColor(), weight: 500, size: 14.0))
        )
      )
    );
  }

  addressReturnCallback(Kpostal result) {
    addressController.text = result.postCode + ' ' + result.address + result.address;
  }

  bool checkSignUp() {
    return true;
  }
}

loginStep({required int step, required String title}) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('STEP $step', style: textStyle(color: serviceColor(), weight: 700, size: 19.0)),
        SizedBox(height: 1),
        Text(title, style: textStyle(weight: 700, size: 19.0))
      ]
    )
  );
}

loginNextButton({String title='다음', required BuildContext context, required Widget route, dynamic dialog, bool condition=true, bool isReplace=false}) {
  return GestureDetector(
    onTap: () async {
      if(dialog != null) dialog(context).then(
        ((_) {navigatorPush(context: context, widget: route, replacement: isReplace);})
      );
      else if(condition) {
        //todo: check phone, email
        navigatorPush(context: context, widget: route, replacement: isReplace);
      }
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