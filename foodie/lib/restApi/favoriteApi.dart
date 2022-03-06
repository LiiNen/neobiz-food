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
  return null;
}

getFavorite(int shopId) async {
  var response = await http.get(Uri.parse('$testUrl$pathFavorite/check/${userInfo.id}/$shopId'));
  if(response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }
  else return null;
}

postFavorite(int shopId) async {
  var requestBody = Map();
  requestBody['userId'] = userInfo.id;
  requestBody['shopId'] = shopId;
  var response = await http.post(Uri.parse('$testUrl$pathFavorite'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(requestBody)
  );
  if(response.statusCode == 200) {
    return true;
  }
  else return false;
}

deleteFavorite(int favoriteId) async {
  var response = await http.delete(Uri.parse('$testUrl$pathFavorite/$favoriteId'));
  if(response.statusCode == 200) {
    return true;
  }
  else return false;
}