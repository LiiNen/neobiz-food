import 'dart:convert';

import 'restApi.dart';
import 'package:http/http.dart' as http;

searchTown({required int townNo, required String mode, int curPage=-1, Map? presetBody}) async {
  String query = '?'
      'town=$townNo'
      '${curPage != -1 ? '&cur_page=$curPage' : ''}';
  var requestBody = Map();
  if(presetBody != null) requestBody = presetBody;
  requestBody['mode'] = mode;
  return searchTownApi(query: query, requestBody: requestBody);
}

searchTownApi({required String query, required Map requestBody}) async {
  var response = await http.post(Uri.parse('$baseUrl$path_town$query'),
      body: requestBody);
  print('$baseUrl$path_town$query');
  print(requestBody);
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);
    if(responseBody['townlist'] != null) return responseBody['townlist'];
    else if(responseBody['unpaid_list'] != null) return responseBody['unpaid_list'];
    else {
      print('error');
      return [];
    }
  }
  else {
    print('error');
    return [];
  }
}