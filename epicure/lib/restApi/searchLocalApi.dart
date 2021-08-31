import 'dart:convert';

import 'restApi.dart';
import 'package:http/http.dart' as http;

searchLocal({required int doNum, required String siName, required String mode, int curPage = -1, Map<String, dynamic>? presetBody}) async {
  String query = '?'
      '${doNum != -1 ? 'do=$doNum' : ''}'
      '${siName != '' ? '&si=$siName' : ''}'
      '${curPage != -1 ? '&cur_page=$curPage' : ''}';
  var requestBody = Map<String, dynamic>();
  if(presetBody != null) requestBody = presetBody;
  requestBody['mode'] = mode;
  print(requestBody);
  return searchLocalApi(query: query, requestBody: requestBody);
}

/// todo: flutter does not accept <String, dynamic>
/// only <String, String> : have to solve
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
    else if(_type == 'shop') {
      return responseBody['unpaid_list'];
    }
    else {
      print('response error');
    }
  }
  else print('url error');
}