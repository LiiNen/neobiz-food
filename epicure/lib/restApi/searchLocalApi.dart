import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'restApi.dart';
import 'package:http/http.dart' as http;

import 'package:foodie/main.dart';

searchLocal({required int doNum, required String siName, required String mode}) async {
  String query = '?do=$doNum${siName!='' ? '&si=$siName' : ''}&mode=$mode&cur_page=$curPage';
  var requestBody = Map<String, dynamic>();
  requestBody['mode'] = mode;
  return searchLocalApi(query: query, requestBody: requestBody);
}

searchLocalApi({required String query, required Map<String, dynamic> requestBody}) async {
  var response = await http.post(Uri.parse('$baseUrl$path_region_list$query'), body: requestBody);
  print('$baseUrl$path_region_list$query');
  print(requestBody);
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);

    var _type = responseBody['type'];
    if(_type == 'region') {
      return responseBody['si_list'];
    }
    else {
      print('response error');
    }
  }
  else print('url error');
}