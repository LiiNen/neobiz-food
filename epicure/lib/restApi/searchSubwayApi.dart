import 'dart:convert';
import 'restApi.dart';
import 'package:http/http.dart' as http;

searchSubway({Map? subwayQueryData, required String mode}) async {
  String query = '?';
  if(subwayQueryData == null) {
    query = query + 'area_no=-1&line=-1&station=-1&cur_page=1';
  } else {
    query = query + 'area_no=${subwayQueryData['areaNo']}&line=${subwayQueryData['lineNo']}&station=${subwayQueryData['stationNo']}&cur_page=1';
  }
  var requestBody = Map();
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
      return responseBody['do_list'];
    }
  }
  else {
    print('error');
  }
}