import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/serviceViews/paymentView/paymentPresentView.dart';
import 'package:foodie/serviceViews/paymentView/paymentView.dart';

class PaymentSelectionView extends StatefulWidget {
  final bool isPresent;
  PaymentSelectionView(this.isPresent);
  @override
  State<PaymentSelectionView> createState() => _PaymentSelectionView(isPresent);
}
class _PaymentSelectionView extends State<PaymentSelectionView> {
  bool isPresent;
  _PaymentSelectionView(this.isPresent);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: isPresent ? '이용권 선물' : '프리미엄 회원'),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paymentStep(step: 2, title: '결제수단 선택'),
            ],
          )
        )
      ),
      bottomNavigationBar: bottomNavigationButton(title: '다음', action: _nextAction),
    );
  }

  _nextAction() {
    if(isPresent) navigatorPush(context: context, widget: PaymentPresentView());
  }
}