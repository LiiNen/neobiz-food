import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'restApi.dart';
import 'package:http/http.dart' as http;

import 'package:foodie/main.dart';

searchLocal({required int doNum, required String siName}) async {
  String query = '?do=$doNum${siName!='' ? '&si=$siName' : ''}&cur_page=$curPage';
  var requestBody = Map<String, dynamic>();
  searchLocalApi(query: query, requestBody: requestBody);
}

searchLocalApi({required String query, required Map<String, dynamic> requestBody}) async {
  var response = await http.post(Uri.parse('$baseUrl$path_region_list$query'));
  print('$baseUrl$path_region_list$query');
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);
  }
  else print('error');
}