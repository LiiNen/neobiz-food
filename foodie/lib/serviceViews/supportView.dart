import 'package:flutter/material.dart';
import 'package:foodie/collections/decorationContainers.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessAppBar.dart';
import 'package:foodie/restApi/inquiryApi.dart';
import 'package:foodie/main.dart';

class SupportItem {
  String? title;
  dynamic callback;
  SupportItem({this.title, this.callback});
}

class SupportView extends StatefulWidget {
  final int supportId;
  final String title;
  SupportView({required this.supportId, this.title=''});

  @override
  State<SupportView> createState() => _SupportView(this.supportId, this.title);
}
class _SupportView extends State<SupportView> {
  int supportId;
  String title;
  _SupportView(this.supportId, this.title);

  TextEditingController titleController = TextEditingController();
  FocusNode titleFocusNode = FocusNode();
  TextEditingController contentController = TextEditingController();
  FocusNode contentFocusNode = FocusNode();
  List<SupportItem> supportItemList = [];

  @override
  void initState() {
    super.initState();
    supportItemList = [
      SupportItem(),
      SupportItem(title: '1:1 문의'),
      SupportItem(title: '맛집 추천하기'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusManager.instance.primaryFocus?.unfocus()},
      child: Scaffold(
        backgroundColor: Color(0xfffcfcfc),
        appBar: DefaultAppBar(title: title == '' ? supportItemList[supportId].title! : title),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  child: Text('고객님의 소중한 의견 부탁드립니다.', style: textStyle(weight: 500, size: 16.0),),
                ),
                SizedBox(height: 24),
                supportTitleTextField('제목', titleController),
                SizedBox(height: 12),
                supportContentTextField('내용', contentController),
              ]
            )
          )
        ),
        bottomNavigationBar: bottomNavigationButton(title: '확인', action: submitAction)
      )
    );
  }

  supportTitleTextField(String title, TextEditingController controller) {
    return Container(
      width: MediaQuery.of(context).size.width, height: 49,
      margin: EdgeInsets.symmetric(horizontal: 21),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: Color(0xffe0e0e0))
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: Color(0xffe0e0e0))
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: Color(0xffe0e0e0))
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 17),
          hintText: title,
          hintStyle: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0)
        ),
        style: textStyle(weight: 600, size: 16.0),
        textInputAction: TextInputAction.next,
        onChanged: (value) {setState(() {});},
        onSubmitted: (value) {contentFocusNode.requestFocus();}
      )
    );
  }

  supportContentTextField(String content, TextEditingController controller) {
    return Container(
      width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height/2,
      margin: EdgeInsets.symmetric(horizontal: 21),
      child: TextField(
        maxLines: 100,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: Color(0xffe0e0e0))
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: Color(0xffe0e0e0))
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide(color: Color(0xffe0e0e0))
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 17, vertical: 11),
          hintText: content,
          hintStyle: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0)
        ),
        style: textStyle(weight: 600, size: 16.0),
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.done,
        onChanged: (value) {setState((){});},
        onSubmitted: (value) {submitAction();}
      )
    );
  }

  submitAction() async {
    if(titleController.text == '') {
      showToast('제목을 입력해주세요');
    } else if(contentController.text == '') {
      showToast('내용을 입력해주세요');
    } else {
      bool isSuccess = false;
      switch(supportId) {
        case 0:
          //todo: 신고하기
          isSuccess = await createInquiry(userId: userId, userName: userName, title: titleController.text, content: contentController.text);
          break;
        case 1:
          isSuccess = await createInquiry(userId: userId, userName: userName, title: titleController.text, content: contentController.text);
          break;
        case 2:
          //todo: 맛집 추천하기
          isSuccess = await createInquiry(userId: userId, userName: userName, title: titleController.text, content: contentController.text);
          break;
      }
      if(isSuccess) {
        showToast('문의가 성공적으로 접수되었습니다.');
        Navigator.pop(context);
      } else {
        showToast('오류 발생. 네트워크를 확인해주세요.');
      }
    }
  }
}