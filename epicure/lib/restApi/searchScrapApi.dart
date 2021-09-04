import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'restApi.dart';
import 'package:http/http.dart' as http;

searchScrap({required String type, int no=0, int? page, Map? presetBody, String list=''}) async {

  final pref = await SharedPreferences.getInstance();
  var uid = pref.getString('uid');

  String query = '?'
      'type=$type' // request type: show, delete, insert
      '&no=${no.toString()}' // add to scrap
      '${page!=null ? '&page=${page.toString()}' : ''}'; // ?
  var requestBody = Map(); // delete : 'list': no
  if(presetBody != null) requestBody = presetBody;
  // requestBody['uid'] = uid;

  return searchScrapApi(query: query, requestBody: requestBody);
}

searchScrapApi({required String query, required Map requestBody}) async {
  // TODO : change to non-trial
  var response = await http.post(Uri.parse('$baseUrl$path_trial_scrap$query'),
    body: requestBody);
  print('$baseUrl$path_scrap$query');
  print(requestBody);
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);
    if(responseBody['result'] == 'success') {
      return responseBody['content'];
    }
  }
  return [];
}