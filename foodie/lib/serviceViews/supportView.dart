import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/restApi/inquiryApi.dart';

import 'package:foodie/main.dart';

class SupportView extends StatefulWidget {
  @override
  State<SupportView> createState() => _SupportView();
}

class _SupportView extends State<SupportView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusManager.instance.primaryFocus?.unfocus()},
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: DefaultAppBar(title: '1:1 문의'),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('고객님의 소중한 의견 부탁드립니다.', style: textStyle(weight: 500, size: 16.0),),
                SizedBox(height: 37),
                fullWidthTextField('제목', titleController),
                fullWidthTextField('내용', contentController),
              ]
            )
          )
        ),
        bottomNavigationBar: bottomNavigationButton(title: '확인', action: submitAction)
      )
    );
  }

  submitAction() async {
    if(titleController.text == '') {
      showToast('제목을 입력해주세요');
    } else if(contentController.text == '') {
      showToast('내용을 입력해주세요');
    } else {
      var isSuccess = await createInquiry(userId: userId, userName: userName, title: titleController.text, content: contentController.text);
      if(isSuccess) {
        showToast('문의가 성공적으로 접수되었습니다.');
      } else {
        showToast('오류 발생. 네트워크를 확인해주세요.');
      }
    }
  }
}