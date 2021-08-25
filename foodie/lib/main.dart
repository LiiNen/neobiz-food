import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage()
    );
  }
}


double maxWidth = 0;

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
        ]
      )
    );
  }
}