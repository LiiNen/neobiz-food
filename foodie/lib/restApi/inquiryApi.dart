import 'dart:convert';

import 'restApi.dart';
import 'package:http/http.dart' as http;

createInquiry({required int userId, required String userName, required String title, required String content}) {
  String query = '/${userId.toString()}';
  var requestBody = Map();
  requestBody['title'] = title;
  requestBody['content'] = content;
  requestBody['userName'] = userName;

  return createInquiryApi(query: query, requestBody: json.encode(requestBody));
}

createInquiryApi({required String query, required requestBody}) async {
  var response = await http.post(Uri.parse('$testUrl$inquiryUser$query'),
      headers: {"Content-Type": "application/json"},
      body: requestBody);

  if(response.statusCode == 200) {
    return true;
  } else return false;
}