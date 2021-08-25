import 'dart:convert';

import 'package:foodie/restApi/signInApi.dart';
import 'package:foodie/restApi/snsLoginApi.dart';

import 'restApi.dart';
import 'package:http/http.dart' as http;

import 'package:foodie/collections/functions.dart';

/// norm signup : return true/false(signUpApi)
signUp({required String email, required String id, required String name, required String hphone, required String passwd, required String address1, String snsType = ''}) async {
  var requestBody = Map<String, dynamic>();
  requestBody['mode'] = 'new';
  requestBody['email'] = email;
  requestBody['id'] = id;
  requestBody['kind'] = 'general';
  requestBody['name'] = name;
  requestBody['hphone'] = hphone;
  requestBody['passwd'] = passwd;
  requestBody['address1'] = address1;
  requestBody['type'] = 'normal';
  if(snsType != '') {
    requestBody['sns_type'] = snsType; /// google, facebook, naver
    requestBody['sns_id'] = email.split('@')[0]
      + (snsType == 'naver' ? '' : '_${snsType[0]}');
    snsLogin(requestBody: requestBody);
  }
  else return signUpApi(requestBody: requestBody);
}

/// return true on successfuly signin
/// return false when all errors
signUpApi({required Map<String, dynamic> requestBody}) async {
  var response = await http.post(Uri.parse('$baseUrl$path_regist'), body: requestBody);

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);

    var _mode = responseBody['mode'];
    if(_mode == 'id_exist') {
      showToast('id already exists');
    } else if(_mode == 'email_exist') {
      showToast('email already exists');
    } else if(_mode == 'hphone_exist') {
      showToast('phone already exists');
    }
    else if( (await login(id: requestBody['id'], pw: requestBody['passwd'])).done ) {
      return true;
    }
  }
  else showToast('check network');
  return false;
}