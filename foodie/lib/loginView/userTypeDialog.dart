import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';

showUserTypeDialog(BuildContext context) async {
  String userType = '';
  bool isUser = false;
  bool isShop = false;
  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Container(
              width: 324, height: 292,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('가입 유형을 선택해주세요', style: textStyle(weight: 500, size: 16.0)),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              isUser = true;
                              isShop = false;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 81, height: 81,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                    border: isUser ? Border.all(color: serviceColor(), width: 2) : Border.all(color: Color(0xffe0e0e0), width: 1)
                                ),
                                child: Center(
                                  child: Image.asset('asset/image/loginUser.png')
                                )
                              ),
                              SizedBox(height: 2),
                              Text('개인', style: textStyle(weight: 500, size: 15.0))
                            ],
                          )
                        ),
                        SizedBox(width: 26),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              isUser = false;
                              isShop = true;
                            });
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  width: 81, height: 81,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                    border: isShop ? Border.all(color: serviceColor(), width: 2) : Border.all(color: Color(0xffe0e0e0), width: 1)
                                  ),
                                  child: Center(
                                      child: Image.asset('asset/image/loginShop.png')
                                  )
                                ),
                                SizedBox(height: 2),
                                Text('점주', style: textStyle(weight: 500, size: 15.0))
                              ],
                            )
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 19),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if(isUser) userType = 'user';
                        if(isShop) userType = 'shop';
                        if(isUser || isShop) Navigator.pop(context, userType);
                      },
                      child: Container(
                        width: 154, height: 49,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: serviceColor()
                        ),
                        child: Center(
                          child: Text('확인', style: textStyle(color: Colors.white, weight: 700, size: 16.0))
                        )
                      )
                    )
                  ]
                )
              )
            )
          );
        }
      );
    }
  );
  return userType;
}