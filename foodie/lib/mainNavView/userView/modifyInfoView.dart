import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/main.dart';
import 'package:foodie/mainNavView/mainNavView.dart';
import 'package:foodie/mainNavView/userView/userView.dart';
import 'package:foodie/restApi/userApi.dart';

class ModifyInfoView extends StatefulWidget {
  @override
  State<ModifyInfoView> createState() => _ModifyInfoView();
}
class _ModifyInfoView extends State<ModifyInfoView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {FocusManager.instance.primaryFocus?.unfocus();},
      child: Scaffold(
        backgroundColor: Color(0xfffcfcfc),
        appBar: DefaultAppBar(title: 'MY'),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleColumn(),
                textFieldColumn(),
              ]
            )
          )
        ),
        bottomNavigationBar: bottomNavigationButton(title: '확인', action: _modifyInfoCallback),
      )
    );
  }

  titleColumn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 26),
          subTitleContainer(title: '회원정보 수정'),
          SizedBox(height: 16),
        ]
      )
    );
  }

  textFieldColumn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: userTextFieldBuilder()
      )
    );
  }

  List<Widget> userTextFieldBuilder() {
    return userInfoList.map((e) {
      return userTextField(title: e.category, currentText: e.value, enabled: true, userController: e.controller);
    }).toList();
  }

  _modifyInfoCallback() async {
    if(userInfoList[0].controller.text != '') {
      var response = await patchUserName(name: userInfoList[0].controller.text);
      if(response == true) {
        showToast('회원정보 수정 완료');
        userInfoList.map((e) {
          e.controller = TextEditingController(); // init
        }).toList();
        await getUser(id: userInfo.id);
        navigatorPush(context: context, widget: MainNavView(initState: 3,), replacement: true, all: true);
      }
      else showToast('네트워크 에러');
    }
    else {
      showToast('입력 필수');
    }
  }
}