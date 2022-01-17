import 'dart:convert';

import 'restApi.dart';
import 'package:http/http.dart' as http;

getShop({required int id}) async {
  var response = await http.get(Uri.parse('$testUrl$pathShop/$id'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body.replaceAll('\\r', ''));
    print(responseBody);
    return responseBody;
  }
  else print('error');
  return null;
}