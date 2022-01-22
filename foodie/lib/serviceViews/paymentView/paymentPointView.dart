import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/main.dart';
import 'package:foodie/mainNavView/mainNavView.dart';

class PaymentPointView extends StatefulWidget {
  @override
  State<PaymentPointView> createState() => _PaymentPointView();
}
class _PaymentPointView extends State<PaymentPointView> {
  TextEditingController pointController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: DefaultAppBar(title: '포인트 결제'),
        backgroundColor: Color(0xfffcfcfc),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children:[
                depositContainer(),
                spaceDivider(),
                infoContainer(),
              ]
            )
          )
        ),
        bottomNavigationBar: bottomNavigationButton(title: '확인', action: _exitPaymentPoint),
      )
    );
  }

  _exitPaymentPoint() async {
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
              padding: EdgeInsets.only(top: 10, bottom: 19, left: 7, right: 7),
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
                  Text('현재 나의 포인트는?', style: textStyle(color: Color(0xff404040), weight: 500, size: 15.0)),
                  SizedBox(height: 6),
                  lineDivider(),
                  SizedBox(height: 15),
                  Text('${userInfo.point}P', style: textStyle(color: serviceColor(), weight: 500, size: 15.0)),
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
              Text('사용하실 포인트 금액을 입력해주세요.', style: textStyle(weight: 500, size: 16.0)),
              SizedBox(height: 32),
              fullWidthTextField('포인트 결제는 4000원부터 사용 가능합니다.', pointController, isNumber: true),
            ]
        )
    );
  }
}