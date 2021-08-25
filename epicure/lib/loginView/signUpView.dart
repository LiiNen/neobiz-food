import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/regexps.dart';

import 'package:foodie/collections/statelessWidgets.dart';
import 'package:foodie/restApi/signUpApi.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpView();
}
class _SignUpView extends State<SignUpView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _pwConfirmController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _idFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _phoneFocusNode = FocusNode();
  FocusNode _pwFocusNode = FocusNode();
  FocusNode _pwConfirmFocusNode = FocusNode();
  FocusNode _addressFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: MainAppBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                textField(controller: _nameController, focusNode: _nameFocusNode, hintText: 'name', nextFocusNode: _emailFocusNode),
                textField(controller: _emailController, focusNode: _emailFocusNode, hintText: 'email', nextFocusNode: _phoneFocusNode),
                textField(controller: _phoneController, focusNode: _phoneFocusNode, hintText: 'phone', nextFocusNode: _emailFocusNode, isNum: true),
                textField(controller: _addressController, focusNode: _addressFocusNode, hintText: 'address', nextFocusNode: _idFocusNode),
                textField(controller: _idController, focusNode: _idFocusNode, hintText: 'id', nextFocusNode: _pwFocusNode),
                textField(controller: _pwController, focusNode: _pwFocusNode, hintText: 'pw', nextFocusNode: _pwConfirmFocusNode),
                textField(controller: _pwConfirmController, focusNode: _pwConfirmFocusNode, hintText: 'pwConfirm', hasNext: false),
                confirmButton(title: '가입하기', confirmAction: signUpAction),
              ],
            )
          )
        )
      )
    );
  }

  Widget textField({required TextEditingController controller, required FocusNode focusNode, required String hintText,
    bool hasNext=true, FocusNode? nextFocusNode, bool isNum=false}) {
    return Container(
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: defaultInputDecoration(hintText: hintText),
        style: textStyle(weight: 400, size: 12.0),
        onChanged: (value) {setState(() {});},
        onSubmitted: (value) {
          setState(() {
            if(hasNext) { nextFocusNode!.requestFocus(); }
            else signUpAction();
          });
        },
        keyboardType: !isNum ? TextInputType.text : TextInputType.number,
        textInputAction: hasNext ? TextInputAction.next : TextInputAction.done,
      )
    );
  }

  signUpAction() {
    if(_nameController.text == '') {

    } else if(_idController.text == '') {

    } else if(_emailController.text == '') {

    } else if(!emailRegexCheck(_emailController.text)) {
      /// wrong email
    } else if(_phoneController.text == '' ) {

    } else if(!phoneRegexCheck(_phoneController.text)) {
      
    } else if(_pwController.text == '') {

    } else if(!pwRegexCheck(_pwController.text)) {

    } else if(_pwController.text != _pwConfirmController.text) {
      /// different pws
    } else {
      signUp(email: _emailController.text, id: _idController.text, name: _nameController.text, hphone: _phoneController.text, passwd: _pwController.text, address1: _addressController.text);
    }
  }
}