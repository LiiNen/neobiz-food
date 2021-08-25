import 'dart:convert';

import 'package:foodie/restApi/signInApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'restApi.dart';
import 'package:http/http.dart' as http;

import 'package:foodie/collections/functions.dart';


snsLogin({required Map<String, dynamic> requestBody, String tel=''}) async {
  String id = requestBody['sns_id'];
  String type = requestBody['sns_type'];
  String email = requestBody['email'];
  
  return findSnsUser(snsUid: id, snsType: type, tel: '', email: email);
}

findSnsUser({required String snsUid, required String snsType, String tel='', String email=''}) async {
  var requestBody = Map<String, dynamic>();
  requestBody['sns_uid'] = snsUid;
  requestBody['sns_type'] = snsType;
  requestBody['tel'] = tel;
  requestBody['email'] = email;

  return findSnsUserApi(requestBody: requestBody);
}

findSnsUserApi({required Map<String, dynamic> requestBody}) async {
  var response = await http.post(Uri.parse('$baseUrl$path_find_sns_user'), body: requestBody);
  String _id = '';
  String _pw = '';

  switch(response.statusCode) {
    case 200:
      var responseBody = json.decode(response.body)['account'];
      _id = responseBody['id'];
      _pw = responseBody['pw'];
      return login(id: _id, pw: _pw);
      break;
    case 202:
      showToast('already has mail or phone, auto connect');
      var responseBody = json.decode(response.body)['account'];
      _id = responseBody['id'];
      _pw = responseBody['pw'];
      return login(id: _id, pw: _pw);
      break;
    case 300:
      showToast('300');
      break;
    default:
      showToast('fail');
      break;
  }
}