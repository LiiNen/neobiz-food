import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/mainNavView/mainNavView.dart';

class PaymentDepositView extends StatefulWidget {
  @override
  State<PaymentDepositView> createState() => _PaymentDepositView();
}
class _PaymentDepositView extends State<PaymentDepositView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: DefaultAppBar(title: '무통장 입금'),
        backgroundColor: Color(0xfffcfcfc),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                depositContainer(),
                spaceDivider(),
                infoContainer(),
              ]
            )
          )
        ),
        bottomNavigationBar: bottomNavigationButton(title: '확인', action: _exitPayment),
      )
    );
  }

  _exitPayment() {
    // todo: 정보 저장 필요
    navigatorPush(context: context, widget: MainNavView(), replacement: true, all: true);
  }

  depositContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: 27),
          AspectRatio(
            aspectRatio: 3.45,
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 4, left: 7, right: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: const Color(0xffe0e0e0), width: 1),
                boxShadow: [BoxShadow(
                  color: const Color(0x17000000),
                  offset: Offset(0,3),
                  blurRadius: 6,
                  spreadRadius: 0
                )] ,
                color: const Color(0xffffffff)
              ),
              child: Column(
                children: [
                  Text('입금계좌', style: textStyle(color: Color(0xff404040), weight: 500, size: 15.0)),
                  SizedBox(height: 6),
                  lineDivider(),
                  Expanded(
                    child: Center(
                      child: Text('국민은행 354602-04-043865 박기향', style: textStyle(color: serviceColor(), weight: 500, size: 15.0)),
                    )
                  )
                ]
              )
            ),
          ),
          SizedBox(height: 24),
        ],
      )
    );
  }

  infoContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 19),
          Text('입금하실 분의 성명과 연락처를 기재해주세요.', style: textStyle(weight: 500, size: 16.0)),
          SizedBox(height: 32),
          fullWidthTextField('이름', nameController),
          fullWidthTextField('연락처', phoneController),
          fullWidthTextField('이메일', emailController),
        ]
      )
    );
  }
}