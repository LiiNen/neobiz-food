import 'package:flutter/material.dart';

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
            content: Container(
              width: 324, height: 292,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('가입 유형을 선택해주세요'),
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
                          child: Container(
                            decoration: BoxDecoration(
                              border: (isUser ? Border.all(color: Colors.blue) : Border.all(color: Colors.transparent))
                            ),
                            child: Column(
                              children: [
                                FlutterLogo(size: 98),
                                SizedBox(height: 2),
                                Text('개인')
                              ],
                            )
                          )
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              isUser = false;
                              isShop = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: (isShop ? Border.all(color: Colors.blue) : null)
                            ),
                            child: Column(
                              children: [
                                FlutterLogo(size: 98),
                                SizedBox(height: 2),
                                Text('맛집')
                              ],
                            )
                          )
                        )
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        if(isUser) userType = 'user';
                        if(isShop) userType = 'shop';
                        if(isUser || isShop) Navigator.pop(context, userType);
                      },
                      child: Text('확인'),
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