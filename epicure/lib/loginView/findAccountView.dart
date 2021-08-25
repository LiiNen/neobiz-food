import 'package:flutter/material.dart';
import 'package:foodie/collections/functions.dart';
import 'package:foodie/collections/statelessWidgets.dart';

class FindAccountView extends StatefulWidget {
  @override
  State<FindAccountView> createState() => _FindAccountView();
}
class _FindAccountView extends State<FindAccountView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: MainAppBar(title: 'find id/pw'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _textField(controller: _nameController, focusNode: _nameFocusNode, hintText: 'name', nextFocusNode: _emailFocusNode),
              _textField(controller: _emailController, focusNode: _emailFocusNode, hintText: 'email', hasNext: false),
              confirmButton(title: 'find!', confirmAction: findAccountAction)
            ]
          )
        )
      )
    );
  }

  Widget _textField({required TextEditingController controller, required FocusNode focusNode, required String hintText,
    bool hasNext=true, FocusNode? nextFocusNode}) {
    return Container(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: defaultInputDecoration(hintText: hintText),
          style: textStyle(weight: 400, size: 12.0),
          onChanged: (value) {setState(() {});},
          onSubmitted: (value) {
            setState(() {
              if(hasNext) { nextFocusNode!.requestFocus(); }
              else findAccountAction();
            });
          },
          textInputAction: hasNext ? TextInputAction.next : TextInputAction.done,
        )
    );
  }

  findAccountAction() {
    print('try to find');
  }
}