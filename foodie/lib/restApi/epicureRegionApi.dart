import 'dart:convert';

import 'restApi.dart';
import 'package:http/http.dart' as http;

getEpicureRegion(String type) async {
  var response = await http.get(Uri.parse('$testUrl$pathEpicureRegion/$type'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    return responseBody;
  }
  return null;
}