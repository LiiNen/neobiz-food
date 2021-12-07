import 'dart:convert';
import 'restApi.dart';
import 'package:http/http.dart' as http;

searchSubway({required Map subwayQueryData, required String mode, Map? presetBody}) async {
  String query = '?'
      'area_no=${subwayQueryData['areaNo']}'
      '&line=${subwayQueryData['lineNo']}'
      '&station=${subwayQueryData['stationNo']}'
      '&cur_page=1';
  var requestBody = Map();
  if(presetBody != null) requestBody = presetBody;
  requestBody['mode'] = mode;
  return searchSubwayApi(query: query, requestBody: requestBody);
}

searchSubwayApi({required String query, required Map requestBody}) async {
  var response = await http.post(Uri.parse('$baseUrl$path_subway$query'), body: requestBody);

  print('$baseUrl$path_subway$query');
  print(requestBody);

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);

    var _type = responseBody['type'];
    if(_type == 'region') {
      if(responseBody['do_list'] != null) return responseBody['do_list'];
      else if(responseBody['linelist'] != null) return responseBody['linelist'];
      else if(responseBody['stationlist'] != null) return responseBody['stationlist'];
      else print('what body?');
    }
    else if(_type == null) {
      return responseBody['unpaid_list'];
    }
  }
  else {
    print('error');
  }
}