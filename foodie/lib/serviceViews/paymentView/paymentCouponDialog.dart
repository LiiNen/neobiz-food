import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';

showPaymentCouponDialog(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => PaymentCouponDialog()
  )) ?? false;
}

class PaymentCouponDialog extends StatefulWidget {
  @override
  State<PaymentCouponDialog> createState() => _PaymentCouponDialog();
}
class _PaymentCouponDialog extends State<PaymentCouponDialog>{

  TextEditingController couponController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: Container(
        width: 324, height: 228,
        padding: EdgeInsets.symmetric(horizontal: 19),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 40),
              Text('쿠폰 번호를 입력해주세요.', style: textStyle(weight: 500, size: 16.0)),
              SizedBox(height: 6),
              Expanded(child: Container()),
              fullWidthTextField('쿠폰번호', couponController, margin: 0),
              Expanded(child: Container()),
              confirmButton(),
              SizedBox(height: 31),
            ]
          )
        )
      )
    );
  }

  confirmButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        //todo coupon action
        Navigator.pop(context);
      },
      child: Container(
        width: 154,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: const Color(0xffff7c2f)
        ),
        child: Center(
          child: Text('확인', style: textStyle(color: Colors.white, weight: 700, size: 15.0))
        )
      )
    );
  }
}