import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/serviceViews/paymentView/paymentSelectionView.dart';

class PaymentView extends StatefulWidget {
  final bool isPresent;
  PaymentView({this.isPresent = false});
  @override
  State<PaymentView> createState() => _PaymentView(isPresent);
}
class _PaymentView extends State<PaymentView> {
  bool isPresent;
  _PaymentView(this.isPresent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: isPresent ? '이용권 선물' : '프리미엄 회원'),
      backgroundColor: Color(0xfffcfcfc),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paymentStep(step: 1, title: '이용권 선택'),
              SizedBox(height: 42),
              paymentChargeContainer(),
            ],
          )
        )
      ),
      bottomNavigationBar: bottomNavigationButton(title: '다음', action: _nextAction),
    );
  }

  paymentChargeContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SvgPicture.asset('asset/image/payment30.svg', width: MediaQuery.of(context).size.width,),
          SizedBox(height: 34),
          SvgPicture.asset('asset/image/payment60.svg', width: MediaQuery.of(context).size.width,),
          SizedBox(height: 34),
          SvgPicture.asset('asset/image/payment365.svg', width: MediaQuery.of(context).size.width,),
        ]
      )
    );
  }

  _nextAction() {
    navigatorPush(context: context, widget: PaymentSelectionView(isPresent));
  }
}

bigBox() {
  return Container(
    color: Colors.red,
    height: 400,
    width: 200,
  );
}

paymentStep({required int step, required String title}) {
  return Container(
    margin: EdgeInsets.only(top: 16, left: 18),
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