import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'restApi.dart';
import 'package:http/http.dart' as http;

class LoginStatus {
  bool done;
  bool leave;
  LoginStatus({required this.done, required this.leave});
}

Future<LoginStatus> login({required String id, required String pw}) async {
  String mode = 'login';
  var requestBody = Map<String, dynamic>();
  requestBody['id'] = id;
  requestBody['passwd'] = pw;

  return await signInApi(mode: '?mode=$mode', requestBody: requestBody);
}

/// @post login
/// response {mode: login_sucess/fail, result: {uid: userId, name: userName, tel: tel, phone: phone, email: email}}
Future<LoginStatus> signInApi({required String mode, required Map<String, dynamic> requestBody}) async {
  bool done = false;
  bool leave = false;

  var response = await http.post(Uri.parse('$baseUrl$path_login$mode'), body: requestBody);

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    print(responseBody);

    var _mode = responseBody['mode'];
    if(_mode == 'login_sucess' || _mode == 'loged_in') {
      done = true;
      var result = responseBody['result'];
      final pref = await SharedPreferences.getInstance();
      pref.setString('name', result['name']);
      pref.setString('email', result['email']);
      if(result['uid'] != null) pref.setString('uid', result['uid']);
      pref.setString('phone', result['phone']);
      pref.setString('tel', result['tel']);

      pref.setStringList('loginInfo', [requestBody['id'], requestBody['passwd']]);
    }
    if(_mode == 'leave_success') {
      leave = true;
    }
  }

  return new LoginStatus(done: done, leave: leave);
}

void setIsInstalled() async {
  final pref = await SharedPreferences.getInstance();
  pref.setBool('isInstalled', true);
}