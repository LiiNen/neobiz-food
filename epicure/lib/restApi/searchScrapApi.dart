import 'dart:convert';

import 'restApi.dart';
import 'package:http/http.dart' as http;

searchScrap({required String type, required int no, required int page, Map? presetBody, String list=''}) async {
  String query = '?'
      'type=$type' // request type: show, delete, insert
      '&no=${no.toString()}' // add to scrap
      '&page=${page.toString()}'; // ?
  var requestBody = Map(); // delete : 'list': no
  if(presetBody != null) requestBody = presetBody;
  requestBody['list']='';
  return searchScrapApi(query: query, requestBody: requestBody);
}

searchScrapApi({required String query, required Map requestBody}) async {
  var response = await http.post(Uri.parse('$baseUrl$path_scrap$query'),
    body: requestBody);
  print('$baseUrl$path_scrap$query');
  print(requestBody);
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);
  }
  return [];
}