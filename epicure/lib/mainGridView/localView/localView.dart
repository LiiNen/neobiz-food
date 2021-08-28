import 'package:flutter/material.dart';
import 'package:foodie/collections/statelessWidgets.dart';

class LocalView extends StatefulWidget {
  @override
  State<LocalView> createState() => _LocalView();
}
class _LocalView extends State<LocalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainTitleBar(title: '대한민국'),
          ],
        )
      )
    );
  }
}