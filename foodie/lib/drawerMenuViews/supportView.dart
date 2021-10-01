import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';

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
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(0.0),
          child: fullWidthButton(title: '확인', action: submitAction),
        ),
      )
    );
  }

  submitAction() {
    print('hello');
  }
}