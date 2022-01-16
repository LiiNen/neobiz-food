import 'dart:convert';

import 'restApi.dart';
import 'package:http/http.dart' as http;

getUser({required int id}) async {
  var response = await http.get(Uri.parse('$testUrl$pathUser/userId/$id'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);
    return responseBody;
  }
  else print('error');
  return null;
}