import 'restApi.dart';
import 'package:http/http.dart' as http;


//check : true if validate
checkEmail(String email) async {
  var response = await http.get(Uri.parse('$baseIp/auth/check/email/$email'));
  if(response.statusCode == 200) {
    return response.body.toString()=='0';
  }
  else return null;
}

checkPhone(String phone) async {
  var response = await http.get(Uri.parse('$baseIp/auth/check/phone/$phone'));
  if(response.statusCode == 200) {
    return response.body.toString()=='0';
  }
  else return null;
}