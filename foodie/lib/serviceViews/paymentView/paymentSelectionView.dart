import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/serviceViews/paymentView/paymentPresentView.dart';
import 'package:foodie/serviceViews/paymentView/paymentView.dart';

class PaymentSelectionItem {
  String? title;
  Widget? route;
  Image? img;
  dynamic callback;
  PaymentSelectionItem({this.title, this.route, this.img, this.callback});
}

class PaymentSelectionView extends StatefulWidget {
  final bool isPresent;
  PaymentSelectionView(this.isPresent);
  @override
  State<PaymentSelectionView> createState() => _PaymentSelectionView(isPresent);
}
class _PaymentSelectionView extends State<PaymentSelectionView> {
  bool isPresent;
  _PaymentSelectionView(this.isPresent);

  var paymentSelectionItemList = [
    PaymentSelectionItem(title: '신용카드 결제'),
    PaymentSelectionItem(title: '무통장 입금',),
    PaymentSelectionItem(title: '휴대폰 결제'),
    PaymentSelectionItem(title: '포인트 결제'),
    PaymentSelectionItem(img: Image.asset('asset/image/paymentKakao.png')),
    PaymentSelectionItem(img: Image.asset('asset/image/paymentNaver.png')),
    PaymentSelectionItem(title: '선물쿠폰 사용'),
  ];

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
              paymentStep(step: 2, title: '결제수단 선택'),
              SizedBox(height: 34),
              paymentSelectionContainer(),
              spaceDivider(),
              socialPaymentSelectionContainer(),
              spaceDivider(),
              elsePaymentSelectionContainer(),
            ],
          )
        )
      ),
      bottomNavigationBar: bottomNavigationButton(title: '다음', action: _nextAction),
    );
  }

  selectionBox(PaymentSelectionItem? _paymentItem) {
    if(_paymentItem == null) {
      return Expanded(child: Container());
    }
    else return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          //todo route or callback
        },
        child: AspectRatio(
          aspectRatio: 3.28,
          child: _paymentItem.img == null ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: const Color(0xffe0e0e0), width: 1),
              color: const Color(0xffffffff),
            ),
            child: Center(
              child: Text(_paymentItem.title!, style: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0)),
            )
          ) : _paymentItem.img!
        )
      )
    );
  }

  paymentSelectionContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title('일반결제'),
          SizedBox(height: 14),
          Row(
            children: [
              selectionBox(paymentSelectionItemList[0]),
              SizedBox(width: 16),
              selectionBox(paymentSelectionItemList[1]),
            ]
          ),
          SizedBox(height: 12),
          Row(
            children: [
              selectionBox(paymentSelectionItemList[2]),
              SizedBox(width: 16),
              selectionBox(paymentSelectionItemList[3]),
            ]
          ),
          SizedBox(height: 22),
        ]
      )
    );
  }

  socialPaymentSelectionContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 17),
          _title('간편결제'),
          SizedBox(height: 14),
          Row(
            children: [
              selectionBox(paymentSelectionItemList[4]),
              SizedBox(width: 16),
              selectionBox(paymentSelectionItemList[5]),
            ]
          ),
          SizedBox(height: 22),
        ]
      )
    );
  }

  elsePaymentSelectionContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 17),
          _title('기타'),
          SizedBox(height: 14),
          Row(
            children: [
              selectionBox(paymentSelectionItemList[6]),
              SizedBox(width: 16),
              selectionBox(null),
            ]
          ),
          SizedBox(height: 22),
        ]
      )
    );
  }

  _title(String title) {
    return Text(title, style: textStyle(weight: 500, size: 16.0));
  }

  _nextAction() {
    if(isPresent) navigatorPush(context: context, widget: PaymentPresentView());
  }
}