import 'dart:convert';

import 'package:foodie/collections/sharedPreferences.dart';
import 'package:foodie/main.dart';

import 'restApi.dart';
import 'package:http/http.dart' as http;

getUser({required int id}) async {
  var response = await http.get(Uri.parse('$testUrl$pathUser/userId/$id'));
  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);
    await setUserInfo(id: responseBody['userId'], name: responseBody['name'], email: responseBody['email'], phone: responseBody['phone'], address: responseBody['address'], point: responseBody['point']);
    return responseBody;
  }
  else print('error');
  return null;
}

patchUserName({required String name}) async {
  var requestBody = Map();
  requestBody['userId'] = userInfo.id;
  requestBody['name'] = name;
  var response = await http.patch(Uri.parse('$testUrl$pathUser/name'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(requestBody)
  );
  print(response.statusCode);
  if(response.statusCode == 200) {
    return true;
  }
  else return false;
}

patchUserPoint({required int point}) async {
  var requestBody = Map();
  requestBody['userId'] = userInfo.id;
  requestBody['point'] = point;
  var response = await http.patch(Uri.parse('$testUrl$pathUser/point'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(requestBody)
  );
  if(response.statusCode == 200) {
    return true;
  }
  else return false;
}