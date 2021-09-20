import 'dart:convert';

import 'restApi.dart';
import 'package:http/http.dart' as http;

detailInfo({required int no}) async {
  String query = '?no=${no.toString()}';
  return detailInfoApi(query: query);
}

detailInfoApi({required String query}) async {
  var response = await http.get(Uri.parse('$baseUrl$path_detail$query'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);
    return responseBody;
  }
}