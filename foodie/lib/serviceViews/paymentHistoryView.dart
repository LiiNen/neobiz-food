import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';

class PaymentHistoryView extends StatefulWidget {
  @override
  State<PaymentHistoryView> createState() => _PaymentHistoryView();
}
class _PaymentHistoryView extends State<PaymentHistoryView> {
  var _paymentHistoryItemList = [];

  @override
  void initState() {
    super.initState();
    _paymentHistoryItemList = [1,2,3,4,5,6,7,7,8];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(title: '결제내역'),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 27, horizontal: 18),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _paymentHistoryItemList.length,
          itemBuilder: (BuildContext context, int index) {
            return paymentContainer();
          }
        )
      )
    );
  }

  paymentContainer() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('이용권 구매 30일', style: textStyle(weight: 500, size: 16.0)),
                  Text('3900원', style: textStyle(color: Color(0xff505050), weight: 500, size: 16.0)),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Text('2021.09.30', style: textStyle(color: Color(0xff8e8e8e), weight: 400, size: 15.0)),
                  SizedBox(width: 5,),
                  Text('무통장 입금', style: textStyle(color: serviceColor(), weight: 500, size: 13.0))
                ]
              )
            ]
          ),
          SizedBox(height: 14),
          lineDivider()
        ]
      )
    );
  }
}