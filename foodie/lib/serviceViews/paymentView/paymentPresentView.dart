import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/mainNavView/mainNavView.dart';
import 'package:foodie/serviceViews/paymentView/paymentView.dart';

class PaymentPresentView extends StatefulWidget {
  @override
  State<PaymentPresentView> createState() => _PaymentPresentView();
}
class _PaymentPresentView extends State<PaymentPresentView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusManager.instance.primaryFocus?.unfocus()},
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: DefaultAppBar(title: '이용권 선물'),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                paymentStep(step: 3, title: '사용자 등록'),
                SizedBox(height: 27),
                userContainer()
              ],
            )
          )
        ),
        bottomNavigationBar: bottomNavigationButton(title: '확인', action: _nextStep),
      )
    );
  }

  userContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('선물하실 사용자를 등록해주세요.', style: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0)),
          SizedBox(height: 37),
          fullWidthTextField('이름', nameController),
          fullWidthTextField('전화번호', phoneController),
        ]
      )
    );
  }

  _nextStep() {
    showToast('선물하기 완료');
    navigatorPush(context: context, widget: MainNavView(), replacement: true, all: true);
  }
}