import 'package:flutter/material.dart';

class FavoriteGreenList extends StatefulWidget {
  @override
  State<FavoriteGreenList> createState() => _FavoriteGreenList();
}
class _FavoriteGreenList extends State<FavoriteGreenList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('green')
    );
  }
}

class FavoriteRedList extends StatefulWidget {
  @override
  State<FavoriteRedList> createState() => _FavoriteRedList();
}
class _FavoriteRedList extends State<FavoriteRedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('red')
    );
  }
}