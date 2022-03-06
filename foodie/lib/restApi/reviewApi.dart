import 'dart:convert';

import 'restApi.dart';
import 'package:http/http.dart' as http;

getReviewShop({required int shopId}) async {
  var response = await http.get(Uri.parse('$testUrl$pathReview/shopId/$shopId'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return responseBody;
  }
  return null;
}

getReviewUser({required int userId}) async {
  var response = await http.get(Uri.parse('$testUrl$pathReview/userId/$userId'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return responseBody;
  }
  return null;
}

postReview({required int shopId, required int userId, required int rating, required String content}) async {
  var requestBody = Map();
  requestBody['shopId'] = shopId.toString();
  requestBody['userId'] = userId.toString();
  requestBody['starRating'] = rating;
  requestBody['content'] = content;

  var response = await http.post(Uri.parse('$testUrl$pathReview'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(requestBody));
  if(response.statusCode == 200) {
    return true;
  }
  return false;
}