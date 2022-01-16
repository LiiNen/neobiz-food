import 'dart:convert';

import 'package:foodie/main.dart';

import 'restApi.dart';
import 'package:http/http.dart' as http;

getFavoriteShopList() async {
  var response = await http.get(Uri.parse('$testUrl$pathFavorite/shopList/${userInfo.id}'));
  if(response.statusCode == 200) {
    var responseBody = jsonDecode(response.body.replaceAll('\\r', ''));
    return responseBody;
  }
  else print('error');
  return null;
}